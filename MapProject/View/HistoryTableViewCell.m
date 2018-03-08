//
//  HistoryTableViewCell.m
//  RedPacket
//
//  Created by yuanying on 2018/2/23.
//  Copyright © 2018年 yuanying. All rights reserved.
//
#define kColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#import "HistoryTableViewCell.h"

@implementation HistoryTableViewCell{
    UIImageView *_iconImg;
    UILabel *_nameL;
    UIImageView *_picImg;
    UILabel *_dateL;//时间
    UILabel *_contentL;
    UILabel *_commentL;//评论
    UILabel *_praiseL;//点赞
    
    UIView *_bgview;
}

+(instancetype)cellWithTableView:(UITableView*)tableView{
    static NSString *ID = @"historycell";
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell) {
        [cell removeFromSuperview];
        cell = nil;
    }
    if (!cell) {
        cell = [[HistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
/** 初始化*/
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUI];
    }
    return self;
}
//设置UI
- (void)setUI{

    _iconImg = [[UIImageView alloc]initWithFrame:CGRectMake(14, 0, 55, 55)];
    _iconImg.image = [UIImage imageNamed:@"icon"];
    _iconImg.layer.cornerRadius = 55/2;
    _iconImg.clipsToBounds = YES;
    [self addSubview:_iconImg];
    
    _bgview = [[UIView alloc]initWithFrame:CGRectMake(_iconImg.right+10, 0, kScreenW-28-_iconImg.width-10, 140)];
    _bgview.backgroundColor = [UIColor whiteColor];
    _bgview.layer.cornerRadius = 10;
    _bgview.clipsToBounds = YES;
    [self addSubview:_bgview];
    //昵称
    _nameL = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, _bgview.width-24, 20)];
    _nameL.text = @"1111111";
    _nameL.textColor = kColor(51, 51, 51, 1);
    _nameL.font = [UIFont systemFontOfSize:15.0];
    [_bgview addSubview:_nameL];
    //图片
    _picImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, _nameL.bottom+10, 100, 67)];
    _picImg.image = [UIImage imageNamed:@"icon"];
    [_bgview addSubview:_picImg];
    //时间
    _dateL = [[UILabel alloc]initWithFrame:CGRectMake(10, _picImg.bottom+12, KMD_N(200), 20)];
    _dateL.text = @"1111111";
    _dateL.textColor = kColor(153,153,153, 1);
    _dateL.font = [UIFont systemFontOfSize:10.0];
    [_bgview addSubview:_dateL];
    //文字
    _contentL = [[UILabel alloc]initWithFrame:CGRectMake(_picImg.right+11, _nameL.bottom, _bgview.width-22-_picImg.width,_picImg.height)];
    _contentL.text = @"文字信息";
    _contentL.textColor = kColor(85, 85, 85, 1);
    _contentL.font = [UIFont systemFontOfSize:13.0];
    [_bgview addSubview:_contentL];
    //评论数 点赞数
    _commentL = [[UILabel alloc]initWithFrame:CGRectMake(_bgview.width-30, 115-20-5, 50, 20)];
    _commentL.text = @"";
    _commentL.textColor = kColor(153,153,153, 1);
    _commentL.font = [UIFont systemFontOfSize:font_10];
    [_bgview addSubview:_commentL];
    _praiseL = [[UILabel alloc]initWithFrame:CGRectMake(_bgview.width-50, 115-20-5, 50, 20)];
    _praiseL.text = @"";
    _praiseL.textColor = kColor(153,153,153, 1);
    _praiseL.font = [UIFont systemFontOfSize:font_10];
    [_bgview addSubview:_praiseL];
}
//传值
- (void)setModel:(HomeModel *)model indexPath:(NSIndexPath *)indexpath{
    //昵称
    _nameL.text = model.userName;
    //文字
    
    NSString *contentStr = model.userContent;
    CGRect tempRect = [contentStr boundingRectWithSize:CGSizeMake(_bgview.width-22-_picImg.width,60) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font_13]}context:nil];
    _contentL.frame = CGRectMake(_picImg.right+11, _picImg.top, tempRect.size.width ,tempRect.size.height);
    _contentL.text = contentStr;
    _contentL.font = [UIFont systemFontOfSize:font_13];
    _contentL.numberOfLines = 0;
    //时间
    _dateL.text = model.createTime;
    //点赞数
    NSString *praiseStr = model.praiseNum;
    CGRect praiseRect = [praiseStr boundingRectWithSize:CGSizeMake(_bgview.width,20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font_10]}context:nil];
    _praiseL.frame = CGRectMake(_bgview.width-praiseRect.size.width-12, _picImg.bottom+11, praiseRect.size.width ,praiseRect.size.height);
    _praiseL.text = praiseStr;
    _praiseL.font = [UIFont systemFontOfSize:font_10];
    //点赞图片
    UIImageView *praiseImg = [[UIImageView alloc]initWithFrame:CGRectMake(_praiseL.left-15-5, _picImg.bottom+10, 15, 15)];
    praiseImg.image = [UIImage imageNamed:@"icon-zan"];
    [_bgview addSubview:praiseImg];
    //评论数
    NSString *commentStr = model.commentsNum;
    CGRect commentRect = [praiseStr boundingRectWithSize:CGSizeMake(_bgview.width,20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font_10]}context:nil];
    _commentL.frame = CGRectMake(praiseImg.left-25,_picImg.bottom+11, commentRect.size.width ,commentRect.size.height);
    _commentL.text = commentStr;
    _commentL.font = [UIFont systemFontOfSize:font_10];
    //评论图片
    UIImageView *commentImg = [[UIImageView alloc]initWithFrame:CGRectMake(_commentL.left-15-5,_picImg.bottom+11, 15, 13)];
    commentImg.image = [UIImage imageNamed:@"icon-pinglun"];
    [_bgview addSubview:commentImg];
}
@end
