//
//  CalendaDaysCell.h
//  CalendarDemo
//
//  Created by SaKa on 2017/1/20.
//  Copyright © 2017年 SaKa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayModel;
@interface CalendaDaysCell : UICollectionViewCell

@property (nonatomic ,strong)DayModel *dayModel;

@property (nonatomic ,assign)BOOL showChinaCalendar;
@property (nonatomic ,assign)BOOL signDay;
@property (nonatomic ,strong)UIView *signView;
@property (nonatomic ,strong)UILabel *inter_Calendar;
@property (nonatomic ,strong)UILabel *china_Calendar;

- (void)signCurrentDay:(DayModel *)dayModel;

@end

