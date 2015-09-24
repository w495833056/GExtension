//
//  GMyPropertyType.m
//  GExtension
//
//  Created by golven on 15/9/24.
//  Copyright © 2015年 magicEngineer. All rights reserved.
//

#import "GMyPropertyType.h"
#import "GMyExtensionConst.h"

@implementation GMyPropertyType

+ (instancetype)propertyTypeWithProperty:(objc_property_t)property {
    return [[self alloc] initWithPropertyType:property];
}

- (instancetype)initWithPropertyType:(objc_property_t)property {
    if (self = [super init]) {
        NSString *att = @(property_getAttributes(property));
//        NSLog(@"%@", att);
        
        //打印出来之后观察他们，T开头，然后V_name结尾
        //T到第一个逗号之间就是他们的类型
        //如果类型长度大于X，就是OC对象类型
        /*
         T@"NSString",C,N,V_name
         T@"NSString",C,N,V_icon
         TI,N,V_age
         T@"NSString",C,N,V_height
         T@"NSNumber",&,N,V_money
         Ti,N,V_sex
         Tc,N,GisGay,V_gay
         */
        
        NSUInteger loc = 1;
        NSUInteger len = [att rangeOfString:@","].location - loc;
        NSString *type = [att substringWithRange:NSMakeRange(loc, len)];
//        NSLog(@"%@", type);
        /*
         @"NSString"
         @"NSString"
         I
         @"NSString"
         @"NSNumber"
         i
         c
         */
        //得到以上内容之后，就要转成具体的类型了
        //看MJ的代码之后，感觉就三大类
        //@、@"xxx"、x
        if ([type isEqualToString:@"@"]) {
            _idtype = YES;
        } else if (type.length > 3 && [type hasPrefix:@"@\""]) {
            NSString *t = [type substringWithRange:NSMakeRange(2, type.length-3)];
            _type = t;
            _classType = NSClassFromString(_type);
            _NumberType = ((_classType == [NSNumber class]) || ([_classType isSubclassOfClass:[NSNumber class]]));
        } else {
            //unsigned int和int对应的是  I 和  i，所以直接看成i处理，就是int类型
            //这里是简单的处理
            NSString *lowerType = type.lowercaseString;
            NSArray *types = @[
                               GMyPropertyTypeInt,
                               GMyPropertyTypeShort,
                               GMyPropertyTypeFloat,
                               GMyPropertyTypeDouble,
                               GMyPropertyTypeLong,
                               GMyPropertyTypeLongLong,
                               GMyPropertyTypeChar,
                               GMyPropertyTypeBOOL,
                               GMyPropertyTypeBOOL2
                               ];
            if ([types containsObject:lowerType]) {
                _NumberType = YES;
                if ([lowerType isEqualToString:GMyPropertyTypeBOOL] || [lowerType isEqualToString:GMyPropertyTypeBOOL2]) {
                    _BoolType = YES;
                }
            }
        }
        
    }
    return self;
}
@end























































