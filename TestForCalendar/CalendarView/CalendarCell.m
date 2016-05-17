//
//  CalendarCell.m
//  TestForCalendar
//
//  Created by new on 16-5-16.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import "CalendarCell.h"

@implementation CalendarCell

@synthesize dateLabel;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320/7, 320/7)];
        dateLabel.textAlignment = NSTextAlignmentCenter;
        dateLabel.font = [UIFont systemFontOfSize:16.0];
        [self.contentView addSubview:dateLabel];
    }
    return self;
}

@end
