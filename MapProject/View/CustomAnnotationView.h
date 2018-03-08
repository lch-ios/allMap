//
//  CustomAnnotationView.h
//  RedPacket
//
//  Created by yuanying on 2018/2/8.
//  Copyright © 2018年 yuanying. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
@class CustomAnnotationView;
@class CustomAnnotation;
@protocol CustomAnnotationViewDelegate <NSObject>

- (void)mapViewdidSelectAnnotationView:(CustomAnnotationView *)view;
@end
@interface CustomAnnotationView : MAAnnotationView
//一定要重写，否则当滑动地图，annotation出现和消失时候会出现数据混乱
- (void)setAnnotation:(id<MAAnnotation>)annotation;
@property (nonatomic,weak) id deleagte;;
@end
