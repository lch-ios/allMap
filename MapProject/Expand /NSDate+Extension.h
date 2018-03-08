//
//  NSDate+Extension.h

//
//  Created by mac on 15/10/24.
//  Copyright (c) 2015年 Andy_WangPeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear;

/**
 *  判断某个时候是否为昨天
 */
- (BOOL)isYesterDay;

/**
 *  判断某个日期是否为今天
 */
- (BOOL)isToday;
@end
