//
//  CustomAnnotation.h
//  RedPacket
//
//  Created by yuanying on 2018/2/8.
//  Copyright © 2018年 yuanying. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
typedef NS_ENUM(NSUInteger, CustomAnnotationType){
    CustomAnnotationTypeN = 0,
    CustomAnnotationTypeY = 1,//表示有红包
    CustomAnnotationTypeI = 2,//标示
};
@interface CustomAnnotation : MAPointAnnotation
@property (nonatomic, assign) CustomAnnotationType type;
@end
