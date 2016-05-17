//
//  CalendarPickerView.m
//  TestForCalendar
//
//  Created by new on 16-5-16.
//  Copyright (c) 2016年 new. All rights reserved.
//

#import "CalendarPickerView.h"
#import "CalendarHeaderView.h"
#import "CalendarUtil.h"

@implementation CalendarPickerView
{
    UICollectionView *mainCollectionView;
    UICollectionViewFlowLayout *layout;
    NSArray *arrWeek;
}

@synthesize todayDate;
@synthesize curDate;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化layout
        layout = [[UICollectionViewFlowLayout alloc] init];
        // 设置滚动方向
//        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        // 设置headerView大小
//        layout.headerReferenceSize = CGSizeMake(self.frame.size.width, 100);
        // 该方法也可以设置itemSize
        layout.itemSize = CGSizeMake(frame.size.width/7, frame.size.width/7);

        mainCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        mainCollectionView.backgroundColor = [UIColor clearColor];
        [self addSubview:mainCollectionView];
        
        // 注册collectionViewCell
        //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
        [mainCollectionView registerClass:[CalendarCell class] forCellWithReuseIdentifier:@"cellId"];
        //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
        [mainCollectionView registerClass:[CalendarHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
        
        mainCollectionView.delegate = self;
        mainCollectionView.dataSource = self;
        
        curDate = [NSDate date];
        todayDate = [NSDate date];
        
        arrWeek = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    }
    return self;
}

- (void)onHitBtnLastMonth:(id)sender {
    curDate = [[CalendarUtil sharedSingleton] getLastMonthDateWithDate:curDate];
    [mainCollectionView reloadData];
}

- (void)onHitBtnNextMonth:(id)sender {
    curDate = [[CalendarUtil sharedSingleton] getNextMonthDateWithDate:curDate];
    [mainCollectionView reloadData];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    CalendarCell *cell = (CalendarCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    NSLog(@"cell index:%@",cell.dateLabel.text);
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return arrWeek.count;
    } else {
        return 35;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarCell *cell = (CalendarCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.dateLabel.text = [NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:indexPath.row]];
        [cell.dateLabel setTextColor:[UIColor colorWithRed:0.231 green:0.807 blue:0.571 alpha:1.000]];
    } else {
        NSInteger daysCount = [[CalendarUtil sharedSingleton] getNumberofDaysInMonthWithDate:curDate];
        NSInteger firstWeekday = [[CalendarUtil sharedSingleton] firstWeekdayInThisMonth:curDate];
        NSInteger i = indexPath.row;
        NSInteger day = 0;
        if (i < firstWeekday) {
            cell.dateLabel.text = @"";
        } else if (i > daysCount + firstWeekday -1) {
            cell.dateLabel.text = @"";
        } else {
            day = i - firstWeekday + 1;
            cell.dateLabel.text = [NSString stringWithFormat:@"%ld",(long)day];
            cell.dateLabel.textColor = [UIColor colorWithWhite:0.261 alpha:1.000];
            
            if ([todayDate isEqualToDate:curDate]) {
                // this month
                if (day == [[CalendarUtil sharedSingleton]getDay:curDate]) {
                    cell.dateLabel.textColor = [UIColor colorWithRed:0.301 green:0.646 blue:0.995 alpha:1.000];
                } else if (day > [[CalendarUtil sharedSingleton]getDay:curDate]) {
                    cell.dateLabel.textColor = [UIColor colorWithWhite:0.674 alpha:1.000];
                }
            } else if ([todayDate compare:curDate] == NSOrderedAscending) {
                cell.dateLabel.textColor = [UIColor colorWithWhite:0.674 alpha:1.000];
            }
        }
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    CalendarHeaderView *headerView = (CalendarHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    NSInteger year = [[CalendarUtil sharedSingleton] getYear:curDate];
    NSInteger month = [[CalendarUtil sharedSingleton] getMonth:curDate];
    NSString *string = [NSString stringWithFormat:@"%ld-%ld",year,month];
    [headerView setLabelTextWithString:string];
    
    [headerView.btnLastMonth addTarget:self action:@selector(onHitBtnLastMonth:) forControlEvents:UIControlEventTouchUpInside];
    [headerView.btnNextMonth addTarget:self action:@selector(onHitBtnNextMonth:) forControlEvents:UIControlEventTouchUpInside];
    return headerView;
}

#pragma mark - UICollectionViewDelegateFlowLayout
//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(320, 40);
    } else {
        return CGSizeZero;
    }
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width/7, self.frame.size.width/7);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


@end
