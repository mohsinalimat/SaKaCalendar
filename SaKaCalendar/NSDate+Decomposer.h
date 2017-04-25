//
//  NSDate+Decomposer.h
//  CalendarDemo
//
//  Created by SaKa on 2017/1/20.
//  Copyright © 2017年 SaKa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Decomposer)




/**
 *  获得当前 NSDate 对象对应的日子
 */
+ (NSInteger)dateDay:(NSDate*)date;

/**
 *  获得当前 NSDate 对象对应的月份
 */
+ (NSInteger)dateMonth:(NSDate*)date;

/**
 *  获得当前 NSDate 对象对应的年份
 */
+ (NSInteger)dateYear:(NSDate*)date;

/**
 *  获得当前 NSDate 对象的上个月的某一天（此处定为15号）的 NSDate 对象
 */
+ (NSDate *)lastMonthDate:(NSDate*)date;

/**
 *  获得当前 NSDate 对象的下个月的某一天（此处定为15号）的 NSDate 对象
 */
+ (NSDate *)nextMonthDate:(NSDate*)date;

/**
 *  获得当前 NSDate 对象对应的月份的总天数
 */
+ (NSInteger)totalDaysOfMonth:(NSDate*)date;

/**
 *  获得当前 NSDate 对象对应月份当月第一天的所属星期
 */
+ (NSInteger)firstWeekDayOfMonth:(NSDate*)date;

@end
