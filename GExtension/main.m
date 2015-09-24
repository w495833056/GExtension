//
//  main.m
//  GExtension
//
//  Created by golven on 15/9/23.
//  Copyright © 2015年 magicEngineer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Properties.h"
#import "NSObject+KeyValueObjs.h"
#import "Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSDictionary *dict = @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png",
                               @"age" : @"20",
                               @"height" : @1.55,
                               @"money" : @"100.9",
                               @"sex" : @(SexFemal),
                               @"gay" : @"true",
                               };
    
        Test *t = [Test objecWithDict:dict];
        NSLog(@"name:%@", t.name);
        NSLog(@"icon:%@", t.icon);
        NSLog(@"age :%u", t.age);
        NSLog(@"height:%ld", (long)t.height);
        NSLog(@"money:%@", t.money);
        NSLog(@"sex:%d", t.sex);
        NSLog(@"gay:%d", t.gay);
    }
    return 0;
}
