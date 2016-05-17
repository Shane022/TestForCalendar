//
//  CalendarUtil.m
//  TestForCalendar
//
//  Created by new on 16-5-17.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import "CalendarUtil.h"

@implementation CalendarUtil

static CalendarUtil *_sharedSingleton = nil;

+ (CalendarUtil *)sharedSingleton {
    if (!_sharedSingleton) {
        _sharedSingleton = [[CalendarUtil alloc] init];
    }
    return _sharedSingleton;
}

- (NSInteger)getNumberofDaysInMonthWithDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

- (NSInteger)getDay:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}


- (NSInteger)getMonth:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

- (NSInteger)getYear:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}

- (NSDate *)getLastMonthDateWithDate:(NSDate *)date {
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    adcomps.month = -1;
    NSDate *lastDate = [[NSCalendar currentCalendar] dateByAddingComponents:adcomps toDate:date options:0];
    return lastDate;
}

- (NSDate *)getNextMonthDateWithDate:(NSDate *)date {
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    adcomps.month = +1;
    NSDate *nextDate = [[NSCalendar currentCalendar] dateByAddingComponents:adcomps toDate:date options:0];
    return nextDate;
}

@end
