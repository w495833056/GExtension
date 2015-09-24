//
//  NSObject+Properties.m
//  GExtension
//
//  Created by golven on 15/9/24.
//  Copyright © 2015年 magicEngineer. All rights reserved.
//

#import "NSObject+Properties.h"
#import <objc/runtime.h>
#import "GMyProperty.h"

@implementation NSObject (Properties)

+ (NSArray *)properties {
    NSMutableArray *arr = [NSMutableArray array];
    
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(self, &count); 
    for (int i = 0 ; i < count; i++) {
        objc_property_t pro = properties[i];
//        NSLog(@"%s", property_getName(pro));
//        NSLog(@"%s", property_getAttributes(pro));
        //@、@"xxx"、int/float....
        
//        NSString *property = @(property_getAttributes(pro));
//        NSUInteger loc = 1;
//        NSUInteger len = [property rangeOfString:@","].location - loc;
//        NSString *type = [property substringWithRange:NSMakeRange(loc, len)];
//        NSLog(@"%@", type);
        
        GMyProperty *property = [GMyProperty propertyWithProperty:pro];
//        NSLog(@"%@", property.name);
        [arr addObject:property];
    }
    return arr;
}

@end
