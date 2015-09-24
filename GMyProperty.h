//
//  GMyProperty.h
//  GExtension
//
//  Created by golven on 15/9/24.
//  Copyright © 2015年 magicEngineer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@class GMyPropertyType;

@interface GMyProperty : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) GMyPropertyType *type;

+ (instancetype)propertyWithProperty:(objc_property_t)property;
@end
