//
//  SaKaMonthCollectionView.h
//  CalendarDemo
//
//  Created by 撒加 on 17/4/25.
//  Copyright © 2017年 BSL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MonthModel;
@interface SaKaMonthCollectionView : UIView
/**
 * 日期选择回调
 */
@property (nonatomic ,copy)void(^selectDateBlock)(NSInteger,NSInteger,NSInteger);


/**
 * showChineseCalendar：显示农历， 默认为YES
 */
@property (nonatomic ,assign)BOOL showChineseCalendar;


- (void)calendarContainerWhereMonth:(NSInteger)currentTag month:(void(^)(MonthModel *month))currentMonth;
@end
