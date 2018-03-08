//
//  HistoryTableViewCell.h
//  RedPacket
//
//  Created by yuanying on 2018/2/23.
//  Copyright © 2018年 yuanying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface HistoryTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView*)tableView;
//传值
- (void)setModel:(HomeModel *)model indexPath:(NSIndexPath *)indexpath;
@end
