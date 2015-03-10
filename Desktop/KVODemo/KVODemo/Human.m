//
//  Human.m
//  KVODemo
//
//  Created by mac on 15-3-10.
//  Copyright (c) 2015年 wangTao. All rights reserved.
//

#import "Human.h"

@implementation Human

- (void)willChangeValueForKey:(NSString *)key
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super willChangeValueForKey:key];
}
- (void)didChangeValueForKey:(NSString *)key
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super didChangeValueForKey:key];
}

@end
