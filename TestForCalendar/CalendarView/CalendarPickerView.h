//
//  CalendarPickerView.h
//  TestForCalendar
//
//  Created by new on 16-5-16.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarCell.h"

@interface CalendarPickerView : UIView<UICollectionViewDelegateFlowLayout,UICollisionBehaviorDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSDate *todayDate;
@property (nonatomic, strong) NSDate *curDate;

@end
