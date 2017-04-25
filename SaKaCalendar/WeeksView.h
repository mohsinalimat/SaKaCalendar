//
//  WeeksView.h
//  CalendarDemo
//
//  Created by SaKa on 2017/1/20.
//  Copyright © 2017年 SaKa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeeksView : UIView

@property (nonatomic ,copy)NSString *year;


- (void)selectMonth:(void (^)(BOOL increase))selectBlock;
@end
