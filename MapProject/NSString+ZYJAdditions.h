//
//  NSString+ZYJAdditions.h
//  类别
//
//  Created by CheMiMacPro on 15/5/18.
//  Copyright (c) 2015年 CheMiMacPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>  //UIFont 需要用

@interface NSString (ZYJAdditions)

/**字符串有效*/
+ (BOOL)isVaildString:(NSString *)value;
//字符串为空
+ (BOOL)isEmpty:(NSString *)value;
//字符串是ip地址
+ (BOOL)isRightIP:(NSString *)value;
//加密
- (NSString *)md5;
//解密
- (NSString *)stringFromMD5;
//url进行转意，转换成可以传递的字符
- (NSString *)encodeUrl;
//string的行数
- (NSInteger)numberOfLinesWithFont:(UIFont*)font
                     withLineWidth:(NSInteger)lineWidth;
///string的高度
- (CGFloat)heightWithFont:(NSInteger)font withLineWidth:(NSInteger)lineWidth;
///string的宽度
- (CGFloat)widthWithFont:(NSInteger)font withLineHeight:(NSInteger)lineHeight;
//去掉字符串中的空格、换行
+ (NSString *)delSpaceAndNewline:(NSString *)string;

/** 计算文本大小 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

//判断是否是有效身份证号码
-(BOOL)identityCardISValidate:(NSString *)identityCard;

//判断是否是有效的手机号码
+(BOOL)phoneNumIsValidate:(NSString *)pnoneNum;

// 将汉字转换成 拼音
+ (NSString *)transform:(NSString *)chinese;
//json字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
// 正则匹配银行卡号是否正确
- (BOOL) checkBankNumber;
- (BOOL)checkPassword;
@end
