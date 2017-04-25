//
//  NSDate+Decomposer.m
//  CalendarDemo
//
//  Created by SaKa on 2017/1/20.
//  Copyright © 2017年 SaKa. All rights reserved.
//

#import "NSDate+Decomposer.h"

@implementation NSDate (Decomposer)

#pragma mark Public Method

+ (NSInteger)totalDaysOfMonth:(NSDate*)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

+ (NSInteger)firstWeekDayOfMonth:(NSDate*)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    components.day = 1; // 定位到当月第一天
    NSDate *firstDay = [calendar dateFromComponents:components];
    
    // 默认一周第一天序号为 1 ，而日历中约定为 0 ，故需要减一
    NSInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDay] - 1;
    return firstWeekday;
}

+ (NSInteger)dateDay:(NSDate*)date {
    NSDateComponents *components = [self currentDateComponents:NSCalendarUnitDay date:date];
    return components.day;
}

+ (NSInteger)dateMonth:(NSDate*)date {
    NSDateComponents *components = [self currentDateComponents:NSCalendarUnitMonth date:date];
    return components.month;
}

+ (NSInteger)dateYear:(NSDate*)date {
    NSDateComponents *components = [self currentDateComponents:NSCalendarUnitYear date:date];
    return components.year;
}


+ (NSDate *)lastMonthDate:(NSDate*)date {
    NSDateComponents *components = [self nearByDateComponents:date]; // 定位到当月中间日子
    if (components.month == 1) {
        components.month = 12;
        components.year -= 1;
    } else {
        components.month -= 1;
    }
    NSDate *lastDate = [[NSCalendar currentCalendar] dateFromComponents:components];

    return lastDate;
}

+ (NSDate *)nextMonthDate:(NSDate*)date {
    NSDateComponents *components = [self nearByDateComponents:date]; // 定位到当月中间日子
    if (components.month == 12) {
        components.month = 1;
        components.year += 1;
    } else {
        components.month += 1;
    }
    NSDate *nextDate = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    return nextDate;
}


#pragma mark Private Method

+ (NSDateComponents*)currentDateComponents:(NSCalendarUnit)calendarUnit date:(NSDate*)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:calendarUnit fromDate:date];
}
+ (NSDateComponents *)nearByDateComponents:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    components.day = 15; // 定位到当月中间日子
    return components;
}
@end
