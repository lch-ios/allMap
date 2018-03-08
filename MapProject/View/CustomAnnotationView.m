//
//  CustomAnnotationView.m
//  RedPacket
//
//  Created by yuanying on 2018/2/8.
//  Copyright © 2018年 yuanying. All rights reserved.
//

#import "CustomAnnotationView.h"
#import "HomeModel.h"
#import "CustomAnnotation.h"
@interface CustomAnnotationView()
@property (nonatomic, strong) UIImageView *backgroundImageView;
@end
@implementation CustomAnnotationView

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    CustomAnnotation *ann = (CustomAnnotation *)annotation;
    self = [super initWithAnnotation:ann reuseIdentifier:reuseIdentifier];
    if (self) {

        [self initializeAnnotation:ann];
    }
    
    return self;
}

- (void)initializeAnnotation:(CustomAnnotation *)ann {
    [self setupAnnotation:ann];
}
- (void)setAnnotation:(id<MAAnnotation>)annotation {
    [super setAnnotation:annotation];
    
    CustomAnnotation *ann = (CustomAnnotation *)self.annotation;
    //当annotation滑出地图时候，即ann为nil时，不设置(否则由于枚举的类型会执行不该执行的方法)，只有annotation在地图范围内出现时才设置，可以打断点调试
    if (ann) {
        [self setupAnnotation:ann];
    }
}
- (void)setupAnnotation:(CustomAnnotation *)ann {
    NSString *mask = @"";
    CGRect frame = CGRectZero;
    switch (ann.type) {
        case CustomAnnotationTypeN: {//没有红包
            frame = CGRectMake(0, 0, 27, 30);
            mask = @"icon-xiaoren";
            self.backgroundImageView.frame = frame;
            self.backgroundImageView.image = [UIImage imageNamed:mask];
            break;
        }
        case CustomAnnotationTypeY: {
            frame = CGRectMake(0, 0, 39, 40.);
            mask = @"icon-hongbao";
            self.backgroundImageView.frame = frame;
            self.image = [UIImage imageNamed:mask];
            self.backgroundImageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction:)];
            //为图片添加手势
            [self.backgroundImageView addGestureRecognizer:singleTap];
            break;
        }
        case CustomAnnotationTypeI: {
            frame = CGRectMake(0, 0, 100., 20.);
            mask = @"juxing";
            self.backgroundImageView.image = [UIImage imageNamed:mask];
            self.backgroundImageView.frame = frame;
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
            label.backgroundColor  = [UIColor whiteColor];
            label.text = @"可见范围2公里";
//            CGFloat sds =  [label.text  widthWithFont:font_15 withLineHeight:20];
//            label.width = sds +10;
            label.textColor = [UIColor redColor];
            label.font = [UIFont systemFontOfSize:15.0];
            label.textAlignment = NSTextAlignmentCenter;
            [self.backgroundImageView addSubview:label];
            
            break;
        }
        default:
            break;
    }
}
-(void)singleTapAction:(UITapGestureRecognizer *)er
{
    if ([self.deleagte respondsToSelector:@selector(mapViewdidSelectAnnotationView:)]) {
        [self.deleagte mapViewdidSelectAnnotationView:self];
    }
}
- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        [self addSubview:_backgroundImageView];
    }
    return _backgroundImageView;
}
@end
