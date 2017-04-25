//
//  SaKaCalendar.h
//  CalendarDemo
//
//  Created by 撒加 on 17/4/25.
//  Copyright © 2017年 BSL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaKaCalendar : UICollectionViewCell
/**
 * showChineseCalendar：显示农历， 默认为YES
 */
@property (nonatomic ,assign)BOOL showChineseCalendar;

/**
 * 日期选择回调
 * year：年
 * month：月
 * day：日
 */
- (void)selectDateOfMonth:(void(^)(NSInteger year,NSInteger month,NSInteger day))selectBlock;
@end
