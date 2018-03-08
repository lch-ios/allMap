//
//  NSDate+Extension.m
//其实楼主的解决办法是可行的，打开https://github.com/CocoaPods/Specs，然后下载下来后，解压缩
//解压缩后一般得到的是Specs-master这个文件夹，这个文件夹下面有一个目录名为Specs，将其重命名为master
//然后将其拖到/Users/用户名/.cocoapods/repos目录下即
//pod update --verbose --no-repo-update
//  Created by mac on 15/10/24.
//  Copyright (c) 2015年 Andy_WangPeng. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear{
    NSCalendar *calender = [NSCalendar currentCalendar];
    //获得某个时间的年月日时分秒
    NSDateComponents *creatCmps = [calender components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calender components:NSCalendarUnitYear fromDate:[NSDate date]];
    return creatCmps.year == nowCmps.year;
    
}
/**
 *  判断某个时候是否为昨天
 */
- (BOOL)isYesterDay{
    
    NSDate *now = [NSDate date];
    //2015-10-15 12:33:28 -->2015-10-15 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *creatStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    //再把字符串转成日期,便于计算
    NSDate *date = [fmt dateFromString:creatStr];
    now = [fmt dateFromString:nowStr];
    
    //创建日历对象(更好的用于比较两个日期的时间差)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year ==0 && cmps.month ==0 && cmps.day == 1;
    
}
/**
 *  判断某个日期是否为今天
 */
- (BOOL)isToday{
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *creatStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:[NSDate date]];
    
    return [creatStr isEqualToString:nowStr];
}

@end
