//
//  UIView+ZYJAdditions.m
//  类别
//
//  Created by CheMiMacPro on 15/5/15.
//  Copyright (c) 2015年 CheMiMacPro. All rights reserved.
//

#import "UIView+ZYJAdditions.h"
#import <objc/runtime.h>
//得到屏幕方向
UIInterfaceOrientation InterfaceOrientation(){
    UIInterfaceOrientation orient = [[UIApplication sharedApplication] statusBarOrientation];
    return orient;
}

@implementation UIView (ZYJAdditions)

////////////////////////////////////////////////////////

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

////////////////////////////////////////////////////////

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

////////////////////////////////////////////////////////

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

////////////////////////////////////////////////////////

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

////////////////////////////////////////////////////////

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

////////////////////////////////////////////////////////

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

////////////////////////////////////////////////////////

-(void)setX:(CGFloat)x{
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}

-(CGFloat)x{
    
    return self.frame.origin.x;
}

////////////////////////////////////////////////////////

-(void)setY:(CGFloat)y{
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y{
    
    return self.frame.origin.y;
}

////////////////////////////////////////////////////////

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

////////////////////////////////////////////////////////

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

////////////////////////////////////////////////////////

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

////////////////////////////////////////////////////////

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

////////////////////////////////////////////////////////

- (CGFloat)screenX
{
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
    }
    return x;
}

////////////////////////////////////////////////////////

- (CGFloat)screenY
{
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
    }
    return y;
}

////////////////////////////////////////////////////////

- (CGFloat)screenScrollViewX
{
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    return x;
}

////////////////////////////////////////////////////////

- (CGFloat)screenScrollViewY
{
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;

        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

////////////////////////////////////////////////////////

- (CGRect)screenFrame
{
    return CGRectMake(self.screenScrollViewX, self.screenScrollViewY, self.width, self.height);
}

////////////////////////////////////////////////////////

- (CGFloat)orientationWidth
{
    return UIInterfaceOrientationIsPortrait(InterfaceOrientation())?self.width : self.height;
}

////////////////////////////////////////////////////////

- (CGFloat)orientationHeight
{
    return UIInterfaceOrientationIsPortrait(InterfaceOrientation())?self.height:self.width;
}

////////////////////////////////////////////////////////

- (UIView*)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}

////////////////////////////////////////////////////////

- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
        
    } else if (self.superview) {
        return [self.superview ancestorOrSelfWithClass:cls];
        
    } else {
        return nil;
    }
}

////////////////////////////////////////////////////////


- (CGPoint)offsetFromView:(UIView*)otherView
{
    CGFloat x = 0, y = 0;
    for (UIView* view = self; view && view != otherView; view = view.superview) {
        x += view.left;
        y += view.top;
    }
    return CGPointMake(x, y);
}


////////////////////////////////////////////////////////
#pragma mark-放大响应区域
/**** 放大响应区域 ***/
void Swizzle(Class c, SEL orig, SEL new) {
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))){
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

+ (void)load {
    Swizzle(self, @selector(pointInside:withEvent:), @selector(myPointInside:withEvent:));
}

- (BOOL)myPointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (UIEdgeInsetsEqualToEdgeInsets(self.touchExtendInset, UIEdgeInsetsZero) || self.hidden ||
        ([self isKindOfClass:UIControl.class] && !((UIControl *)self).enabled)) {
        return [self myPointInside:point withEvent:event]; // original implementation
    }
    CGRect hitFrame = UIEdgeInsetsInsetRect(self.bounds, self.touchExtendInset);
    hitFrame.size.width = MAX(hitFrame.size.width, 0); // don't allow negative sizes
    hitFrame.size.height = MAX(hitFrame.size.height, 0);
    return CGRectContainsPoint(hitFrame, point);
}

static char touchExtendInsetKey;
- (void)setTouchExtendInset:(UIEdgeInsets)touchExtendInset {
    objc_setAssociatedObject(self, &touchExtendInsetKey, [NSValue valueWithUIEdgeInsets:touchExtendInset],OBJC_ASSOCIATION_RETAIN);
}

- (UIEdgeInsets)touchExtendInset {
    return [objc_getAssociatedObject(self, &touchExtendInsetKey) UIEdgeInsetsValue];
}














@end
