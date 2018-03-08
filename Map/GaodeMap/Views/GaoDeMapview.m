//
//  GaoDeMapview.m
//  map
//
//  Created by lujh on 2017/3/21.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "GaoDeMapview.h"
@interface GaoDeMapview ()

@property(nonatomic,strong)MAMapView *mapView;

@end
@implementation GaoDeMapview

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super init]) {
        //初始化高德地图
        _mapView = [[MAMapView alloc] initWithFrame:frame];
        
        ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
//        _mapView.showsUserLocation = YES;
//        _mapView.userTrackingMode = MAUserTrackingModeFollow;
//        _mapView.showsScale = YES;
        _mapView.mapType = MAMapTypeStandard;
//        _mapView.delegate = self;
        //显示用户位置
        //如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
        _mapView.showsUserLocation = YES;
        _mapView.userTrackingMode = MAUserTrackingModeFollow;
        //缩放等级
        [_mapView setZoomLevel:16 animated:YES];
        //是否显示比例尺
        _mapView.showsScale = NO;
        //是否显示指南针
        _mapView.showsCompass = NO;
        //是否支持旋转
        _mapView.rotateEnabled = NO;
        //是否支持天空模式
        _mapView.skyModelEnable = NO;
        //是否显示楼块
        _mapView.showsBuildings = NO;
        //logo位置 隐藏高德地图
        [_mapView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView * logoM = obj;
                logoM.layer.contents = (__bridge id)[UIImage imageNamed:@""].CGImage;
            }
        }];
        
        
        MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
        r.showsAccuracyRing = NO;///精度圈是否显示，默认YES
//        r.showsHeadingIndicator = NO;///是否显示方向指示(MAUserTrackingModeFollowWithHeading模式开启)。默认为YES
//        r.fillColor = [UIColor redColor];///精度圈 填充颜色, 默认 kAccuracyCircleDefaultColor
//        r.strokeColor = [UIColor blueColor];///精度圈 边线颜色, 默认 kAccuracyCircleDefaultColor
//        r.lineWidth = 2;///精度圈 边线宽度，默认0
//        
//        r.image = [UIImage imageNamed:@"你的图片"]; ///定位图标, 与蓝色原点互斥
        [self.mapView updateUserLocationRepresentation:r];

    }
    return self;
}
- (UIView*)getView {
    
    return _mapView;
    
}

@end
