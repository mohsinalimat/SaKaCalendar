//
//  MonthOpeartion.h
//  CalendarDemo
//
//  Created by SaKa on 2017/1/22.
//  Copyright © 2017年 SaKa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MonthModel;


@interface MonthOpeartion : NSObject
@property (nonatomic ,assign)NSInteger currentDay;
@property (nonatomic ,assign)NSInteger currentMonth;
@property (nonatomic ,assign)NSInteger currentYear;


+ (instancetype)defaultMonthOpeartion;



/**
 * 获取日历容器数据
 * currentTag：本月偏移值（0：当前月=本月，1：当前月=下一月，-1：当前月=上一月，........）
 * calendar: 日历容器内数据回调
 */
- (void)calendarContainerWithNearByMonths:(NSInteger)currentTag daysOfMonth:(void(^)(NSArray *daysArray,MonthModel *month))calendar;





@end
