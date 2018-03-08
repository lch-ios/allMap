//
//  UIColor+Extension.m
//  YXDrive
//
//  Created by DSDL on 2016/11/24.
//  Copyright © 2016年 fuwuda. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //color = [color lowercaseString];
    //去掉前后空格换行符
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6){
        return [UIColor blackColor];
    }
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
        
    }else if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6){
        return [UIColor blackColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end
