//
//  GMyExtensionConst.h
//  GExtension
//
//  Created by golven on 15/9/24.
//  Copyright © 2015年 magicEngineer. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const GMyPropertyTypeInt;
extern NSString *const GMyPropertyTypeShort;
extern NSString *const GMyPropertyTypeFloat;
extern NSString *const GMyPropertyTypeDouble;
extern NSString *const GMyPropertyTypeLong;
extern NSString *const GMyPropertyTypeLongLong;
extern NSString *const GMyPropertyTypeChar;
extern NSString *const GMyPropertyTypeId;
extern NSString *const GMyPropertyTypeBOOL;
extern NSString *const GMyPropertyTypeBOOL2;

/*
 一定要注意下bool类型，因为数据中我们的bool类型不一定就真的是bool来表示
 ，
 起码到现在为止要么就是字符串yes、true或者数字1、0来表示
 。
 所以c也有可能是bool类型，因此我们在定义的时候c也要考虑到bool中去
 */