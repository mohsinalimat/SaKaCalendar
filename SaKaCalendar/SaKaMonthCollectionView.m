//
//  SaKaMonthCollectionView.m
//  CalendarDemo
//
//  Created by 撒加 on 17/4/25.
//  Copyright © 2017年 BSL. All rights reserved.
//

#import "SaKaMonthCollectionView.h"
#import "CalendaDaysCell.h"
#import "NSDate+Decomposer.h"
#import "MonthOpeartion.h"
#import "CalendarModel.h"
#define CalendarColor [UIColor colorWithRed:240.0/255.0 green:156.0/255.0 blue:40.0/255.0 alpha:1.0]
@interface SaKaMonthCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic ,strong)UICollectionView *collection;
@property (nonatomic ,strong)NSMutableArray *showMonths;
@property (nonatomic ,strong)NSArray *days;
@property (nonatomic ,strong)NSArray *daysArray;
@property (nonatomic ,strong)UILabel *monthLabel;
@property (nonatomic ,assign)NSInteger maxContainer;
@property (nonatomic ,copy)NSString *yearLabel;
@end
@implementation SaKaMonthCollectionView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self bsl_controls];
    }
    return self;
}
- (void)bsl_controls{
    [self addSubview:self.monthLabel];
    
    [self addSubview:self.collection];
    
    _collection.delegate = self;
    _collection.dataSource = self;
    
    
}
- (void)calendarContainerWhereMonth:(NSInteger)currentTag month:(void(^)(MonthModel *month))currentMonth{
    __weak typeof(self) weakSelf = self;
    
    [[MonthOpeartion defaultMonthOpeartion] calendarContainerWithNearByMonths:currentTag daysOfMonth:^(NSArray *daysArray,MonthModel *month) {
        if (daysArray.count>0) {
            weakSelf.daysArray = daysArray;
            weakSelf.monthLabel.text = [NSString stringWithFormat:@"%ld",month.month];
            currentMonth(month);
            [weakSelf.collection reloadData];
        }
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = CGRectGetWidth(self.frame);
    CGFloat h = CGRectGetHeight(self.frame);
    self.collection.frame = CGRectMake(0, 0, w, h);
    self.monthLabel.frame = self.bounds;
    
}

#pragma mark init UICollectionView
- (UICollectionView*)collection{
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 0.0;
        _collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collection.backgroundColor = [UIColor clearColor];
        [_collection registerClass:NSClassFromString(@"CalendaDaysCell") forCellWithReuseIdentifier:@"cell"];
    }
    return _collection;
}

#pragma mark UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.daysArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    CalendaDaysCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    DayModel *dayModel = self.daysArray[indexPath.row];
    cell.dayModel = dayModel;
    [cell signCurrentDay:dayModel];
    cell.showChinaCalendar = self.showChineseCalendar;
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CalendaDaysCell *cell = (CalendaDaysCell *)[collectionView cellForItemAtIndexPath:indexPath];
    for (CalendaDaysCell *othersCell in collectionView.visibleCells) {
        if (CGColorEqualToColor(othersCell.signView.backgroundColor.CGColor, CalendarColor.CGColor)) {
            othersCell.inter_Calendar.textColor = [UIColor blackColor];
            othersCell.china_Calendar.textColor = [UIColor blackColor];
            othersCell.signView.backgroundColor = [UIColor clearColor];
        };
    }
    cell.inter_Calendar.textColor = [UIColor whiteColor];
    cell.china_Calendar.textColor = [UIColor whiteColor];
    cell.signView.backgroundColor = CalendarColor;
    
    if (self.selectDateBlock) {
        MonthOpeartion *opeartion = [MonthOpeartion defaultMonthOpeartion];
        self.selectDateBlock(opeartion.currentYear, opeartion.currentMonth, cell.dayModel.day);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger weeks = self.daysArray.count/7;
    CGFloat w = CGRectGetWidth(collectionView.bounds);
    CGFloat h = CGRectGetHeight(collectionView.bounds);
    return CGSizeMake(w/7.0, h/weeks);
    
}


- (NSMutableArray *)showMonths{
    if (!_showMonths) {
        _showMonths = [NSMutableArray arrayWithCapacity:2];
    }
    return _showMonths;
}


- (UILabel *)monthLabel{
    if (!_monthLabel) {
        _monthLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _monthLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:200/2550.f];
        _monthLabel.font = [UIFont systemFontOfSize:150.0f weight:120.f];
        _monthLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _monthLabel;
}
@end
