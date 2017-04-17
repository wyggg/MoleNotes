//
//  YGClassCollection.h
//  YGClassCollection
//
//  Created by iOS wugang on 16/8/17.
//  Copyright © 2016年 吴港. All rights reserved.
//

#ifndef YGClassCollection_h
#define YGClassCollection_h

//使用 UIImage+YGTool 需要导入 Accelerate.framework

#import "UIView+YGTool.h"
#import "UIButton+YGTool.h"
#import "UIImage+YGTool.h"
#import "UIColor+YGTool.h"
#import "NSObject+YGTool.h"
#import "NSString+YGTool.h"
#import "NSTimer+YGTool.h"
#import "NSDate+YGTool.h"


//屏幕宽高
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

//快速定义弱引用的self指针
#define K_WEAK_SELF(PointerName) __weak typeof(self) PointerName = self;
#define K_WEAK_SELF_aSelf K_WEAK_SELF(aSelf)

//NSLog定义
#ifdef DEBUG

# define NSLog(...) NSLog(__VA_ARGS__)

# define YLog(fmt, ...) NSLog((@"<%@:(%d)> \n" fmt "\n\n"),[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,##__VA_ARGS__)

# define YLog1(fmt, ...) NSLog((@"\n-  文件：%@"  "\n-  位置：%d 行 \n" "-  函数：%s\n"  "-  日志：" fmt "\n\n"),[[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,__FUNCTION__,##__VA_ARGS__)


#else
# define NSLog(...)
# define  YLog(...)
# define  YLog1(...)
#endif


/// 当前系统版本大于等于某版本
#define IOS_SYSTEM_VERSION_EQUAL_OR_ABOVE(v) (([[[UIDevice currentDevice] systemVersion] floatValue] >= (v))? (YES):(NO))


//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)



#pragma mark - 判断

#if TARGET_OS_IPHONE
//真机
#endif
#if TARGET_IPHONE_SIMULATOR
//模拟器
#endif

#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

#endif /* YGClassCollection_h */
