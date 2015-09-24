//
//  NSObject+KeyValueObjs.m
//  GExtension
//
//  Created by golven on 15/9/24.
//  Copyright © 2015年 magicEngineer. All rights reserved.
//

#import "NSObject+KeyValueObjs.h"
#import "NSObject+Properties.h"
#import "GMyProperty.h"
#import "GMyPropertyType.h"
#import <objc/runtime.h>

@implementation NSObject (KeyValueObjs)

+ (instancetype)objecWithDict:(id)dict {
    if (!dict) {
        return nil;
    }
    return [[[self alloc] init] setValuesWithDict:dict];
    /*
     NSObject * obj = [[self alloc] init];
     [obj setValuesWithDict:dict];
     return obj;
     */
}

- (instancetype)setValuesWithDict:(id)dict {
    NSArray *propertys = [self.class properties];
    for (GMyProperty *property in propertys) {
        id value = [dict valueForKey:property.name];
        if (!value) {
            continue;
        }
        
        GMyPropertyType *propertyType = property.type;
        if (propertyType.isNumberType) {
            NSString *oldValue = value;
            //如果value直接就是数字值那就不走这里了
            //但是如果是值是用字符串表示的，那还得转成数字值
            if ([value isKindOfClass:[NSString class]]) {
                value = [[[NSNumberFormatter alloc] init] numberFromString:value];
                if (propertyType.isBoolType) {
                    //判断是不是bool类型，就直接这样了
                    //所以才需要弄一个oldValue
                    if ([oldValue.lowercaseString isEqualToString:@"yes"]||[oldValue.lowercaseString isEqualToString:@"true"]) {
                        value = @YES;
                    }
                    if ([oldValue.lowercaseString isEqualToString:@"no"]||[oldValue.lowercaseString isEqualToString:@"false"]) {
                        value = @NO;
                    }
                }
            }
        } else {
            if (propertyType == [NSURL class]) {
                value = [value absoluteString];
            }
        }
        [self setValue:value forKey:property.name];
    }
    return self;
}

@end
