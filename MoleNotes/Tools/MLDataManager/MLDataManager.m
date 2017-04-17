//
//  MLDataManager.m
//  MoleNotes
//
//  Created by iOS wugang on 2017/4/17.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import "MLDataManager.h"

@implementation MLDataManager

+ (id)shareDataManager{
    static MLDataManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

@end
