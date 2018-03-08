//
//  UIImage+Extension.h
//  YXDrive
//
//  Created by DSDL on 2016/12/19.
//  Copyright © 2016年 fuwuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
//渲染图片
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 压缩图片
 
 @param sourceImage 目标图片
 @param targetWidth 目标宽度
 @return 返回压缩之后的图
 */
- (UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth;
@end
