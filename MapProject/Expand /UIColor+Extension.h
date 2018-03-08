//
//  UIColor+Extension.h
//  YXDrive
//
//  Created by DSDL on 2016/11/24.
//  Copyright © 2016年 fuwuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
/**
 *  传入16进制颜色码，不需要带#号，设置字体颜色
 *
 *  @param color 传入16进制颜色码
 *  @param alpha 透明度
 *
 *  @return
 */
//[UIColor colorWithHexString:@"dfdfdf" alpha:1.0f];
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
