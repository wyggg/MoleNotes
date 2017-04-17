//
//  UIColor+YGTool.h
//  YGClassCollection
//
//  Created by iOS wugang on 16/9/5.
//  Copyright © 2016年 吴港. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YGTool)

#pragma mark - 颜色扩展

///随机色
+ (UIColor *)randomColor;

#pragma mark - 取图片主题色
/*使用原图将非常消耗性能 所以要压缩*/

///根据图片的主题色创建颜色 图片会被默认压缩成20*20以节省性能
+ (UIColor *)colorWithImageTheme:(UIImage *)image;

///根据图片的主题色创建颜色;  multiplier：将图片尺寸按该比例压缩 （0-1 比例越小速度越快 但精度会变低）
+ (UIColor *)colorWithImageTheme:(UIImage *)image multiplier:(CGFloat)multiplier;

///根据图片的主题色创建颜色; imageSize：将图片压缩为指定尺寸（尺寸越小速度越快 但精度会变低）
+ (UIColor *)colorWithImageTheme:(UIImage *)image imageSize:(CGSize)size;


@end
