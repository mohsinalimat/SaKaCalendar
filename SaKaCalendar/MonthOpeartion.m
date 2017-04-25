//
//  MonthOpeartion.m
//  CalendarDemo
//
//  Created by SaKa on 2017/1/22.
//  Copyright © 2017年 SaKa. All rights reserved.
//

#import "MonthOpeartion.h"
#import "NSDate+Decomposer.h"
#import "CalendarModel.h"

@interface MonthOpeartion ()



@property (nonatomic ,copy)NSDate *currentDate;

@end

@implementation MonthOpeartion

+ (instancetype)defaultMonthOpeartion{
    static MonthOpeartion *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[MonthOpeartion alloc]init];
    });
    return obj;
}


//获取calendar容器里日期

- (void)calendarContainerWithNearByMonths:(NSInteger)currentTag daysOfMonth:(void(^)(NSArray *daysArray,MonthModel *month))calendar{
    NSArray *nearByMonths = [self nearByMonths:currentTag];
    if (nearByMonths.count<1) return;
    NSMutableArray *daysArray = [NSMutableArray arrayWithCapacity:2];

    //获取本月相近的前后两月信息
    MonthModel *firstModel = [nearByMonths objectAtIndex:0];
    MonthModel *lastModel = [nearByMonths objectAtIndex:2];
    MonthModel *currentModel = [nearByMonths objectAtIndex:1];
    
    //显示上一月天数
    NSInteger showLastMonthDays = currentModel.firstWeekday;
    //还剩对少天没有满一星期
    NSInteger lastWeekDays = (currentModel.totalDays-(7-showLastMonthDays))%7;
    //显示下一月天数
    NSInteger showNextMonthDays = 7- (lastWeekDays!=0? lastWeekDays:7);
    
    //获取日历第一个星期含有上月末尾日期 lastMonth
    for(int idex = 0;idex < showLastMonthDays ;idex++) {
        DayModel *dayModel = [[DayModel alloc]init];
        dayModel.isInMonth = NO;
        dayModel.isNowDay = NO;
        dayModel.year = firstModel.year;
        dayModel.month = firstModel.month;
        dayModel.day = firstModel.totalDays-showLastMonthDays+idex+1;
        [daysArray addObject:dayModel];
    }
    //获取日历本月的日期  currentMonth
    for (int idex = 0;idex<currentModel.totalDays ;idex++) {
        DayModel *dayModel = [[DayModel alloc]init];
        dayModel.isInMonth = YES;
        dayModel.year = currentModel.year;
        dayModel.month = currentModel.month;
        dayModel.day = idex+1;
        //判断日期是否为当前日期
        dayModel.isNowDay = [self currentDayNowMonth:dayModel];
        [daysArray addObject:dayModel];
    }
    //获取日历最后一星期含有下月的日期 nextMonth
    for(int idex = 0;idex < showNextMonthDays ;idex++) {
        DayModel *dayModel = [[DayModel alloc]init];
        dayModel.isInMonth = NO;
        dayModel.isNowDay = NO;
        dayModel.year = lastModel.year;
        dayModel.month = lastModel.month;
        dayModel.day = idex+1;
        [daysArray addObject:dayModel];
    }
    calendar(daysArray,currentModel);
}



// 本月临近两月
- (NSArray *)nearByMonths:(NSInteger)currentTag{
    //@[lastMonth,currentMonth,nextMonth];
    NSDate *date = [NSDate date];
    NSDate *last = [NSDate lastMonthDate:date];
    NSDate *next = [NSDate nextMonthDate:date];
    
    
    if (currentTag>0) {
        for (int i = 0; i <currentTag; i++) {
            date = [NSDate nextMonthDate:date];
            last = [NSDate lastMonthDate:date];
            next = [NSDate nextMonthDate:date];
            
        }
    }
    else{
        currentTag = labs(currentTag);
        for (int i = 0; i <currentTag; i++) {
            date = [NSDate lastMonthDate:date];
            last = [NSDate lastMonthDate:date];
            next = [NSDate nextMonthDate:date];
        }
    }
    self.currentDate = date;
    MonthModel *currentMonth = [self monthWithDate:date];
    MonthModel *lastMonth = [self monthWithDate:last];
    MonthModel *nextMonth = [self monthWithDate:next];
    
    return @[lastMonth,currentMonth,nextMonth];
}


- (BOOL)currentDayNowMonth:(DayModel*)dayModel{
    NSInteger nowDay = [NSDate dateDay:[NSDate date]];
    NSInteger nowMonth = [NSDate dateMonth:[NSDate date]];
    NSInteger nowYear = [NSDate dateYear:[NSDate date]];
    if (dayModel.year!=nowYear) {
        return NO;
    }
    if (dayModel.month!=nowMonth) {
        return NO;
    }
    if (dayModel.day!=nowDay) {
        return NO;
    }
    return YES;

}

- (NSInteger)currentDay{
    return [NSDate dateDay:self.currentDate];
}
- (NSInteger)currentMonth{
    return [NSDate dateMonth:self.currentDate];
}
- (NSInteger)currentYear{
    return [NSDate dateYear:self.currentDate];
}
- (NSDate*)currentDate{
    if (!_currentDate) {
        _currentDate = [NSDate date];
    }
    return _currentDate;
}


//***************************************************************************


- (MonthModel*)monthWithDate:(NSDate*)date{
    MonthModel *model = [[MonthModel alloc]init];
    model.totalDays = [NSDate totalDaysOfMonth:date];
    model.firstWeekday = [NSDate firstWeekDayOfMonth:date];
    model.day = [NSDate dateDay:date];
    model.month = [NSDate dateMonth:date];
    model.year = [NSDate dateYear:date];
    return model;
}




@end
