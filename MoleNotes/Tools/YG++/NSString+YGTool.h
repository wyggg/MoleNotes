//
//  NSString+YGTool.h
//  YGClassCollection
//
//  Created by iOS wugang on 16/8/16.
//  Copyright © 2016年 吴港. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (YGTool)

#pragma mark - 

@property (nonatomic, weak, readonly) NSURL *URL;
@property (nonatomic, weak, readonly) UIImage *image;
@property (nonatomic, weak, readonly) NSData *dataUTF8;

#pragma mark - 正则

///是否为空
- (BOOL)isNullString;

///是否全部是空格
- (BOOL)isAllWhiteSpace;

///过滤全部空格
- (NSString *)removeAllSpace;

///使用正则判断字符串
- (BOOL)regexMatch:(NSString *)regexString;

///是否是邮箱
- (BOOL)isEmail;

///是否是手机号
- (BOOL)isPhone;

///电话号码中间4位****显示
- (NSString*)getSecrectPhoneString;

///是否是银行卡号
- (BOOL)isBankCardNumber;

///银行卡号中间8位****显示
- (NSString*)getSecrectBankCardNumberString;

///是否是URL
- (BOOL)isUrl;

///是否是邮政编码
- (BOOL)isMailCode;

///是否是身份证号
- (BOOL)isIdCard;

///是否是身份证号（严格）
- (BOOL)isIdCardFormStrict;

///是否是车牌号
- (BOOL)isCarNumber;

///是否包含Emoji表情
- (BOOL)isContainsEmoji;

///过滤字符串中包含的Emoji表情
- (NSString *)removeAllEmiji;


#pragma mark - size

///计算字符串 Size
- (CGSize)textSize:(CGSize)size
          fontSize:(CGFloat)fontSize;

///根据 宽 计算 高
- (CGFloat)textHeightWithW:(CGFloat)strWidth
                  fontSize:(CGFloat)fontSize;

///根据 高 计算 宽
- (CGFloat)textWithWithH:(CGFloat)strHeight
                 fontSize:(CGFloat)fontSize;


@end

//空对象安全处理
@interface NSNull (nullString)

///非空判断
- (BOOL)isNullString;
@property (nonatomic, weak, readonly) NSURL *URL;
@property (nonatomic, weak, readonly) UIImage *image;
@property (nonatomic, weak, readonly) NSData *dataUTF8;

//系统常用
@property (readonly) NSUInteger length;
- rangeOfCharacterFromSet:(id)a;
- hasColorGlyphsInRange:(id)a attributes:(id)b;
- (BOOL)isEqualToString:(NSString *)str;

@end
