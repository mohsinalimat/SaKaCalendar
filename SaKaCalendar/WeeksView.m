//
//  WeeksView.m
//  CalendarDemo
//
//  Created by SaKa on 2017/1/20.
//  Copyright © 2017年 SaKa. All rights reserved.
//

#import "WeeksView.h"

@interface WeeksView ()


@property (nonatomic, strong)NSMutableArray *labsArray;
@property (nonatomic, strong)UIButton *lastButton;
@property (nonatomic, strong)UIButton *nextButton;
@property (nonatomic, strong)UILabel *yearLabel;


@property (nonatomic, copy)void((^selectMonthBlock)(BOOL increase));


@end
@implementation WeeksView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self bsl_controls];
    }
    return self;
}
- (void)bsl_controls{
    
    [self addSubview:self.lastButton];
    [self addSubview:self.nextButton];
    [self addSubview:self.yearLabel];
    [self.lastButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *weekArray = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    for (NSString *title in weekArray)  {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor = [UIColor clearColor];
        label.text = title;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [self.labsArray addObject:label];
    }
}
- (void)selectMonth:(void (^)(BOOL increase))selectBlock{
    self.selectMonthBlock = selectBlock;
}
- (void)setYear:(NSString *)year{
    _year = year;
    if (!_year) return;
        
    self.yearLabel.text = _year;
    
}





- (void)buttonClick:(UIButton*)btn{
    BOOL increase = NO;
    switch (btn.tag) {
        case 100:
            increase = NO;
            break;
        case 200:
            increase = YES;
            break;
            
        default:
            break;
    }
    if (self.selectMonthBlock) {
        self.selectMonthBlock(increase);
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = CGRectGetWidth(self.frame);
    CGFloat h = CGRectGetHeight(self.frame);
    
    CGFloat btn_maginTop = 5.0f;
    CGFloat btn_maginleft = 5.0f;
    CGFloat btn_h = 15.0f;
    CGFloat btn_w = (w-2*btn_maginleft)*0.4;
    self.lastButton.frame = CGRectMake(btn_maginleft, btn_maginTop, btn_w, btn_h);
    CGFloat next_maginleft = w - 2*(btn_w+btn_maginleft)+CGRectGetMaxX(self.lastButton.frame);
    self.nextButton.frame = CGRectMake(next_maginleft, btn_maginTop, btn_w, btn_h);
    CGFloat yearLab_w =  w - 2*(btn_w+btn_maginleft);
    self.yearLabel.frame = CGRectMake(CGRectGetMaxX(self.lastButton.frame), btn_maginTop,  yearLab_w, btn_h);
    CGFloat lab_maginTop = CGRectGetMaxY(self.lastButton.frame);
    CGFloat lab_h = h - CGRectGetMaxY(self.lastButton.frame);

    for (int i = 0; i < self.labsArray.count; ++i) {
        UILabel *label = self.labsArray[i];
        label.frame = CGRectMake(i * (w/7.0), lab_maginTop, w/7.0, lab_h);
    }
    
    
    
}
- (NSMutableArray*)labsArray{
    if (!_labsArray) {
        _labsArray = [NSMutableArray arrayWithCapacity:2];
    }
    return _labsArray;
}
- (UIButton *)lastButton{
    if (!_lastButton) {
        _lastButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lastButton setTitle:@"上一月" forState:UIControlStateNormal];
        [_lastButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        _lastButton.backgroundColor = [UIColor whiteColor];
        _lastButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _lastButton.tag = 100;
        _lastButton.frame = CGRectZero;
    }
    return _lastButton;
}
- (UIButton *)nextButton{
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextButton setTitle:@"下一月" forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        _nextButton.backgroundColor = [UIColor whiteColor];
        _nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _nextButton.tag = 200;
        _nextButton.frame = CGRectZero;
    }
    return _nextButton;
}
- (UILabel *)yearLabel{
    if (!_yearLabel) {
        _yearLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _yearLabel.textColor = [UIColor whiteColor];
        _yearLabel.font = [UIFont systemFontOfSize:14];
        _yearLabel.textAlignment = NSTextAlignmentCenter;
        _yearLabel.text = @"2017";
    }
    return _yearLabel;
}














@end
