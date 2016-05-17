//
//  CalendarHeaderView.h
//  TestForCalendar
//
//  Created by new on 16-5-17.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarHeaderView : UICollectionReusableView

@property (nonatomic, strong) UIButton *btnLastMonth;
@property (nonatomic, strong) UIButton *btnNextMonth;

- (void)setLabelTextWithString:(NSString *)text;

@end
