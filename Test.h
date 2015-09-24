//
//  Test.h
//  GExtension
//
//  Created by golven on 15/9/23.
//  Copyright © 2015年 magicEngineer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SexMale,
    SexFemal
}Sex;

@interface Test : NSObject
/** 名称 */
@property (copy  , nonatomic)     NSString *name;
/** 头像 */
@property (copy  , nonatomic)     NSString *icon;
/** 年龄 */
@property (assign, nonatomic)     unsigned int age;
/** 身高 */
@property (assign, nonatomic)     NSInteger height;
/** 财富 */
@property (strong, nonatomic)     NSNumber *money;
/** 性别 */
@property (assign, nonatomic)     Sex sex;
/** 同性恋 */
@property (assign, nonatomic, getter=isGay) BOOL gay;

@end
