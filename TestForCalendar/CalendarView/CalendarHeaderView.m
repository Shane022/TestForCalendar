//
//  CalendarHeaderView.m
//  TestForCalendar
//
//  Created by new on 16-5-17.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import "CalendarHeaderView.h"

@implementation CalendarHeaderView

{
    UILabel *monthLabel;
}

@synthesize btnLastMonth, btnNextMonth;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:0.231 green:0.807 blue:0.571 alpha:1.000]];
        
        monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, frame.size.height)];
        monthLabel.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        monthLabel.textAlignment = NSTextAlignmentCenter;
        monthLabel.textColor = [UIColor whiteColor];
        [self addSubview:monthLabel];
    
        CGSize btnSize = CGSizeMake(20, 20);
        CGFloat offsetLeft = 10;
        CGFloat offsetRight = frame.size.width - offsetLeft - btnSize.width;
        CGFloat offsetTop = (frame.size.height - btnSize.height)/2;
        btnLastMonth = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnLastMonth setBackgroundImage:[UIImage imageNamed:@"bt_previous.png"] forState:UIControlStateNormal];
        btnLastMonth.frame = CGRectMake(offsetLeft, offsetTop, btnSize.width, btnSize.height);
        [self addSubview:btnLastMonth];
        
        btnNextMonth = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnNextMonth setBackgroundImage:[UIImage imageNamed:@"bt_next.png"] forState:UIControlStateNormal];
        btnNextMonth.frame = CGRectMake(offsetRight, offsetTop, btnSize.width, btnSize.height);
        [self addSubview:btnNextMonth];
    }
    return self;
}

- (void)setLabelTextWithString:(NSString *)text {
    monthLabel.text = text;
}

@end