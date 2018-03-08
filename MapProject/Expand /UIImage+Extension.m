//
//  UIImage+Extension.m
//  YXDrive
//
//  Created by DSDL on 2016/12/19.
//  Copyright © 2016年 fuwuda. All rights reserved.
//

#import "UIImage+Extension.h"
@implementation UIImage (Extension)
//改变单一图片颜色
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 压缩图片

 @param sourceImage 目标图片
 @param targetWidth 目标宽度
 @return 返回压缩之后的图
 */
- (UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth {
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetHeight = (targetWidth / width) * height;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(targetWidth, targetHeight), NO, [UIScreen mainScreen].scale);
    
    [sourceImage drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
