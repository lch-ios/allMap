//
//  UIButton+LLExtension.h
//  Andy_Category
//
//  Created by 933 on 15/12/29.
//  Copyright © 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};
typedef void(^ButtonActionBlock) (UIButton *button);

@interface UIButton (LLExtension)

/**
 *  创建文字Button
 *
 *  @param frame           frame
 *  @param title           title
 *  @param titleColor      文字颜色
 *  @param actionSel       block回调
 */
+(instancetype)LL_buttonCustomButtonFrame:(CGRect)frame
                                    title:(NSString *)title
                        currentTtileColor:(UIColor *)titleColor
                                actionSel:(ButtonActionBlock)actionSel;



/**
 *  创建图片Button
 *
 *  @param frame             frame
 *  @param normalImgString   按钮的正常状态图片
 *  @param actionSel         block回调
 */
+(instancetype)LL_buttonCustomButtonFrame:(CGRect)frame 
                        normalImageString:(NSString *)normalImgString
                                actionSel:(ButtonActionBlock)actionSel;


//左侧一个图片按钮的情况
+(UIBarButtonItem*)itemWithTarget:(id)target action:(SEL)action Image:(NSString*)imageName highImage:(NSString*)highImageName;
//右侧一个图片按钮的情况
+(UIButton*)addRightBarButtonWithFirstImage:(UIImage *)firstImage target:(id)target action:(SEL)action;
//右侧为文字item的情况
+(UIBarButtonItem*)addRightBarButtonItemWithTitle:(NSString *)itemTitle target:(id)target action:(SEL)action;
//左侧为文字item的情况
- (UIBarButtonItem*)addLeftBarButtonItemWithTitle:(NSString *)itemTitle target:(id)target action:(SEL)action;
//右侧两个图片item的情况
- (UIBarButtonItem*)addRightTwoBarButtonsWithFirstImage:(UIImage *)firstImage target:(id)target  firstAction:(SEL)firstAction secondImage:(UIImage*)secondImage secondAction:(SEL)secondAction;
//底部按钮的 比如： 登录 &注册 &确认等等
+(UIButton*)setBottomWithTitle:(NSString *)title;
-(void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                       imageTitleSpace:(CGFloat)space;
@end
