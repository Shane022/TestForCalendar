//
//  ViewController.m
//  TestForCalendar
//
//  Created by new on 16-5-16.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import "ViewController.h"
#import "CalendarPickerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CalendarPickerView *calendarPickerView = [[CalendarPickerView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 360)];
    calendarPickerView.todayDate = [NSDate date];
    calendarPickerView.curDate = calendarPickerView.todayDate;
    [self.view addSubview:calendarPickerView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
