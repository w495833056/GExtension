//
//  GMyProperty.m
//  GExtension
//
//  Created by golven on 15/9/24.
//  Copyright © 2015年 magicEngineer. All rights reserved.
//

#import "GMyProperty.h"
#import "GMyPropertyType.h"

@implementation GMyProperty

+ (instancetype)propertyWithProperty:(objc_property_t)property {
    return [[self alloc] initWithProperty:property];
}

- (instancetype)initWithProperty:(objc_property_t)property {
    if (self = [super init]) {
        _name = @(property_getName(property));
        _type = [GMyPropertyType propertyTypeWithProperty:property];
    }
    return self;
}
@end
