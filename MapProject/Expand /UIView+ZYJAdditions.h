//
//  UIView+ZYJAdditions.h
//  类别
//
//  Created by CheMiMacPro on 15/5/15.
//  Copyright (c) 2015年 CheMiMacPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZYJAdditions)

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGSize size;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGFloat x;

@property (nonatomic) CGFloat y;

//距离屏幕的left,top

@property (nonatomic, readonly) CGFloat screenX;

@property (nonatomic, readonly) CGFloat screenY;

//滚动视图距离屏幕的 left,top

@property (nonatomic, readonly) CGFloat screenScrollViewX;

@property (nonatomic, readonly) CGFloat screenScrollViewY;

@property (nonatomic, readonly) CGRect screenFrame;

//屏幕不论横竖向时，view的宽，高

@property (nonatomic, readonly) CGFloat orientationWidth;

@property (nonatomic, readonly) CGFloat orientationHeight;

/**** 放大响应区域 ***/
@property UIEdgeInsets touchExtendInset;

//view自己或子孙控件是cls类型的
- (UIView*)descendantOrSelfWithClass:(Class)cls;

//view自己或superview是cls类型的
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

@end
