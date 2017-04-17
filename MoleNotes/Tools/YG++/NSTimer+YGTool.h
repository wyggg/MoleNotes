//
//  NSTimer+YGTool.h
//  YGClassCollection
//
//  Created by iOS wugang on 16/9/13.
//  Copyright © 2016年 吴港. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (YGTool)

+ (void)execHelperBlock:(NSTimer *)timer;

///添加定时任务Block执行
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

///添加定时任务Block执行
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

@end
