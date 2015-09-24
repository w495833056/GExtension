//
//  GMyPropertyType.h
//  GExtension
//
//  Created by golven on 15/9/24.
//  Copyright © 2015年 magicEngineer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface GMyPropertyType : NSObject
@property (nonatomic, readonly) NSString *type;

/**id类型*/
@property (nonatomic, readonly, getter=isIdType)        BOOL idtype;

/**基本数据类型*/
@property (nonatomic, readonly, getter=isNumberType)    BOOL NumberType;

/**BOOL类型*/
@property (nonatomic, readonly, getter=isBoolType)      BOOL BoolType;

/**OC对象类型*/
@property (nonatomic, readonly) Class classType;

+ (instancetype)propertyTypeWithProperty:(objc_property_t)property;
@end
