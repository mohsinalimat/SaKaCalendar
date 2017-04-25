//
//  CalendarModel.h
//  CalendarDemo
//
//  Created by SaKa on 2017/1/20.
//  Copyright © 2017年 SaKa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DayModel;

@interface MonthModel : NSObject


@property (nonatomic, assign) NSInteger totalDays; // 当月的天数
@property (nonatomic, assign) NSInteger firstWeekday; //第一天是星期几（0：周日，1：周一....）
@property (nonatomic, assign) NSInteger year; //本年
@property (nonatomic, assign) NSInteger month; //本月
@property (nonatomic, assign) NSInteger day; //当天


@end


@interface DayModel : MonthModel

@property (nonatomic, assign) BOOL isNowDay; //这天是不是在当月里某一天

@property (nonatomic, assign) BOOL isInMonth; //这天是不是在当月里某一天




@end
