//
//  YXCustButton.m
//  YXDrive
//
//  Created by DSDL on 2016/11/24.
//  Copyright © 2016年 fuwuda. All rights reserved.
//

#import "YXCustButton.h"
#import <Availability.h>
#define Margin 0
@interface YXCustButton()
//记录当前title的字体属性值
@property(nonatomic,weak)UIFont *myFont;
@end

@implementation YXCustButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self  = [super initWithFrame:frame]) {
        [self setup];
        
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    self.myFont = [UIFont systemFontOfSize:13];
    [self.titleLabel setFont:self.myFont];
//    [self setTitleColor:[UIColor colorWithHexString:@"0e89ed" alpha:1.0] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"xiala"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"xiala"] forState:UIControlStateSelected];
    self.adjustsImageWhenHighlighted = NO;
    self.imageView.contentMode = UIViewContentModeCenter;
    self.imageView.layer.masksToBounds = NO;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.left = self.imageView.left;
    self.imageView.left  =CGRectGetMaxX(self.titleLabel.frame) + Margin;
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    
    
    [self sizeToFit];
}

@end
