//
//  UIButton+LLExtension.m
//  Andy_Category
//
//  Created by 933 on 15/12/29.
//  Copyright © 2015年 Andy. All rights reserved.
//

#import "UIButton+LLExtension.h"


/**
 *  内部类声明、实现
 */
@interface LLExtensionButton : UIButton

@property(nonatomic,copy) ButtonActionBlock actionSel;

@end

@implementation LLExtensionButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(void)buttonClick:(UIButton *)button
{
    if (self.actionSel)
    {
        self.actionSel(self);
    }
}

@end

@implementation UIButton (LLExtension)

//创建普通文字button
+(instancetype)LL_buttonCustomButtonFrame:(CGRect)frame
                                    title:(NSString *)title
                        currentTtileColor:(UIColor *)titleColor
                                actionSel:(ButtonActionBlock)actionSel
{
    LLExtensionButton *button = [LLExtensionButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.actionSel = actionSel;
    return button;
}

//创建图片button
+(instancetype)LL_buttonCustomButtonFrame:(CGRect)frame
                        normalImageString:(NSString *)normalImgString
                                actionSel:(ButtonActionBlock)actionSel
{
    LLExtensionButton *button =  [LLExtensionButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:normalImgString] forState:UIControlStateNormal];
    button.actionSel = actionSel;
    return button;
}

//左侧一个图片按钮的情况
+(UIBarButtonItem*)itemWithTarget:(id)target action:(SEL)action Image:(NSString*)imageName highImage:(NSString*)highImageName{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(15,0,22,22)];
    view.backgroundColor = [UIColor clearColor];
    YXCustButton *firstButton = [YXCustButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 22, 22);
    [firstButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [firstButton setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [firstButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //    if (@available(iOS 11, *)) {
    firstButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
//    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5 *kScreenW /375.0,0,0)];
    //    }
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:firstButton];
    return leftBarButtonItem;
}


//右侧一个图片按钮的情况
+(UIButton*)addRightBarButtonWithFirstImage:(UIImage *)firstImage target:(id)target action:(SEL)action
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,44,44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 44, 44);
    [firstButton setImage:firstImage forState:UIControlStateNormal];
    [firstButton setImage:firstImage forState:UIControlStateHighlighted];
    [firstButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //    if (@available(iOS 11, *)) {
    firstButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0,0,0, -5 *kScreenW /375.0)];
    //    }
    
    return firstButton;
}

//右侧为文字item的情况
+(UIBarButtonItem*)addRightBarButtonItemWithTitle:(NSString *)itemTitle target:(id)target action:(SEL)action
{
    
    UIButton *rightbBarButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,88,44)];
    [rightbBarButton setTitle:itemTitle forState:(UIControlStateNormal)];
    [rightbBarButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    rightbBarButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightbBarButton addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    //    if (@available(iOS 11, *)) {
    rightbBarButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
    [rightbBarButton setTitleEdgeInsets:UIEdgeInsetsMake(0,0,0, -5 * kScreenW/375.0)];
    //    }
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightbBarButton];
    return rightBarButtonItem;
}
//左侧为文字item的情况
- (UIBarButtonItem*)addLeftBarButtonItemWithTitle:(NSString *)itemTitle target:(id)target action:(SEL)action
{
    UIButton *leftbBarButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,44,44)];
    [leftbBarButton setTitle:itemTitle forState:(UIControlStateNormal)];
    [leftbBarButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    leftbBarButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [leftbBarButton addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    //    if (@available(iOS 11, *)) {
    leftbBarButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
    [leftbBarButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -5  *kScreenW/375.0,0,0)];
    //    }
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbBarButton];
    return leftBarButtonItem;
}

//右侧两个图片item的情况
- (UIBarButtonItem*)addRightTwoBarButtonsWithFirstImage:(UIImage *)firstImage target:(id)target  firstAction:(SEL)firstAction secondImage:(UIImage*)secondImage secondAction:(SEL)secondAction
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,80,44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(44, 6, 30, 30);
    [firstButton setImage:firstImage forState:UIControlStateNormal];
    [firstButton addTarget:target action:firstAction forControlEvents:UIControlEventTouchUpInside];
    if (@available(iOS 11, *)) {
        firstButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
        [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0,0,0, -5 * kScreenW/375.0)];
    }
    [view addSubview:firstButton];
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame = CGRectMake(6, 6, 30, 30);
    [secondButton setImage:secondImage forState:UIControlStateNormal];
    [secondButton addTarget:target action:secondAction forControlEvents:UIControlEventTouchUpInside];
    if (@available(iOS 11, *)) {
        secondButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
        [secondButton setImageEdgeInsets:UIEdgeInsetsMake(0,0,0, -5 * kScreenW/375.0)];
    }
    [view addSubview:secondButton];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    
    return rightBarButtonItem;
}
/** 创建nav文字btn **/
+ (UIButton*)buttonWithFrame:(CGRect)frame Title:(NSString*)title TitleColor:(UIColor*)color TitleFont:(CGFloat)font Target:(id)target Action:(SEL)action
{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

/** 设置底部按钮 */
+(UIButton*)setBottomWithTitle:(NSString *)title{
    
    UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    bottomBtn.backgroundColor = [UIColor colorWithHexString:@"0e89eb" alpha:1.0];
    bottomBtn.layer.cornerRadius = 5.0;
    bottomBtn.layer.masksToBounds = YES;
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [bottomBtn setTitle:title forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    return bottomBtn;
}
-(void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                       imageTitleSpace:(CGFloat)space {
    /**
     * 知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     * 如果只有title，那它上下左右都是相对于button的，image也是一样；
     * 如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    /**
     MKButtonEdgeInsetsStyleTop, // image在上，label在下
     MKButtonEdgeInsetsStyleLeft, // image在左，label在右
     MKButtonEdgeInsetsStyleBottom, // image在下，label在上
     MKButtonEdgeInsetsStyleRight // image在右，label在左
     */
    switch (style) {
        case MKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case MKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
@end
