//
//  UIColor+YGTool.m
//  YGClassCollection
//
//  Created by iOS wugang on 16/9/5.
//  Copyright © 2016年 吴港. All rights reserved.
//

#import "UIColor+YGTool.h"

@implementation UIColor (YGTool)

//随机色
+ (UIColor *)randomColor{
    CGFloat hue = (arc4random()%256/256.0);
    CGFloat saturation = (arc4random()%128/256.0)+0.5;
    CGFloat brightness = (arc4random()%128/256.0)+0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

+ (UIColor *)colorWithImageTheme:(UIImage *)image{
    return [UIColor colorWithImageTheme:image imageSize:CGSizeMake(20, 20)];
}

+ (UIColor *)colorWithImageTheme:(UIImage *)image multiplier:(CGFloat)multiplier{
    if (multiplier>1) {
        multiplier=1;
    }
    if (multiplier<=0) {
        return nil;
    }
    
    CGSize size = image.size;
    UIColor *color = [UIColor colorWithImageTheme:image imageSize:CGSizeMake(size.width*multiplier, size.height*multiplier)];
    return color;
}

+ (UIColor *)colorWithImageTheme:(UIImage *)image imageSize:(CGSize)size{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,size.width,size.height,8,size.width*4,colorSpace,bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, size.width, size.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL) return nil;
    
    NSCountedSet *cls=[NSCountedSet setWithCapacity:size.width*size.height];
    
    for (int x=0; x<size.width; x++) {
        for (int y=0; y<size.height; y++) {
            
            int offset = 4*(x*y);
            
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
            
        }
    }
    CGContextRelease(context);
    //找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        
        if ( tmpCount < MaxCount ) continue;
        
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f)
                           green:([MaxColor[1] intValue]/255.0f)
                            blue:([MaxColor[2] intValue]/255.0f)
                           alpha:([MaxColor[3] intValue]/255.0f)];
}

@end
