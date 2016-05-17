//
//  CalendarUtil.h
//  TestForCalendar
//
//  Created by new on 16-5-17.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarUtil : NSObject

+ (CalendarUtil *)sharedSingleton;

- (NSInteger)getNumberofDaysInMonthWithDate:(NSDate *)date;
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;
- (NSInteger)getDay:(NSDate *)date;
- (NSInteger)getMonth:(NSDate *)date;
- (NSInteger)getYear:(NSDate *)date;
- (NSDate *)getLastMonthDateWithDate:(NSDate *)date;
- (NSDate *)getNextMonthDateWithDate:(NSDate *)date;

@end
