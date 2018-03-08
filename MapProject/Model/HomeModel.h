//
//  HomeModel.h
//  RedPacket
//
//  Created by yuanying on 2018/2/8.
//  Copyright © 2018年 yuanying. All rights reserved.
//

#import <Foundation/Foundation.h>
//NSDictionary *dict = @{@"bestLuckMoney":@"8.88",
//                       @"getAllNum":@"2",
//                       @"getAllMoney":@"10.00",
//                       @"myPackListData":@[@{@"userIcon":@"",@"userName":@"11",@"userPics":@"",@"userContent":@"11这个红包大家都可以领取",@"commentsNum":@"11",@"praiseNum":@"22"},
//                                           @{@"userIcon":@"",@"userName":@"22",@"userPics":@"",@"userContent":@"22这个红包大家都可以领取",@"commentsNum":@"33",@"praiseNum":@"44"},
//                                           @{@"userIcon":@"",@"userName":@"33",@"userPics":@"",@"userContent":@"33这个红包大家都可以领取",@"commentsNum":@"55",@"praiseNum":@"66"}]
//                       }
@interface HomeModel : NSObject
@property(nonatomic,assign)double lat;
@property(nonatomic,assign)double lot;
@property(nonatomic,copy)NSString *isReadPack;//是否有红包 0没有，1有
@property(nonatomic,copy)NSString *getAllMoney;
@property(nonatomic,copy)NSString *getAllNum;
@property(nonatomic,copy)NSString *bestLuckMoney;
@property(nonatomic,copy)NSString *userIcon;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *userPics;
@property(nonatomic,copy)NSString *userContent;
@property(nonatomic,copy)NSString *commentsNum;
@property(nonatomic,copy)NSString *praiseNum;
@property (nonatomic, copy) NSString *createTime;//创建时间

@end
