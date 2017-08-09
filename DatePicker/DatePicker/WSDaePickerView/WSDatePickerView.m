//
//  WSDatePickerView.m
//  WSDatePicker
//
//  Created by iMac on 17/2/23.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "WSDatePickerView.h"
#import "UIView+Extension.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kPickerSize self.datePicker.frame.size
#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])
#define RGB(r, g, b) RGBA(r,g,b,1)


#define MAXYEAR 2099
#define MINYEAR 0

typedef void(^doneBlock)(NSDate *);

@interface WSDatePickerView ()<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate> {
    //日期存储数组
    NSMutableArray *_yearArray;
    NSMutableArray *_monthArray;
    NSMutableArray *_dayArray;
    NSMutableArray *_hourArray;
    NSMutableArray *_minuteArray;
    NSString *_dateFormatter;
    //记录位置
    NSInteger yearIndex;
    NSInteger monthIndex;
    NSInteger dayIndex;
    NSInteger hourIndex;
    NSInteger minuteIndex;
    
    NSInteger preRow;
    
    NSDate *_startDate;

}
@property (weak, nonatomic) IBOutlet UIView *buttomView;
@property (weak, nonatomic) IBOutlet UILabel *showYearView;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

- (IBAction)doneAction:(UIButton *)btn;


@property (nonatomic,strong)UIPickerView *datePicker;
@property (nonatomic, retain) NSDate *scrollToDate;//滚到指定日期
@property (nonatomic,strong)doneBlock doneBlock;
@property (nonatomic,assign)WSDateStyle datePickerStyle;


@end

@implementation WSDatePickerView
/**
 默认滚动到当前时间
 */
-(instancetype)initWithDateStyle:(WSDateStyle)datePickerStyle CompleteBlock:(void(^)(NSDate *))completeBlock {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];

        
        self.datePickerStyle = datePickerStyle;
        switch (datePickerStyle) {
            case DateStyleShowYearMonthDayHourMinute:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
            case DateStyleShowMonthDayHourMinute:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
            case DateStyleShowYearMonthDay:
                _dateFormatter = @"yyyy-MM-dd";
                break;
            case DateStyleShowMonthDay:
                _dateFormatter = @"yyyy-MM-dd";
                break;
            case DateStyleShowHourMinute:
                _dateFormatter = @"HH:mm";
                break;
                
            default:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
        }
        
        [self setupUI];
        [self defaultConfig];
        
        if (completeBlock) {
            self.doneBlock = ^(NSDate *selectDate) {
                completeBlock(selectDate);
            };
        }
    }
    return self;
}

/**
 滚动到指定的的日期
 */
-(instancetype)initWithDateStyle:(WSDateStyle)datePickerStyle scrollToDate:(NSDate *)scrollToDate CompleteBlock:(void(^)(NSDate *))completeBlock {
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
        
        
        self.datePickerStyle = datePickerStyle;
        self.scrollToDate = scrollToDate;
        switch (datePickerStyle) {
            case DateStyleShowYearMonthDayHourMinute:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
            case DateStyleShowMonthDayHourMinute:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
            case DateStyleShowYearMonthDay:
                _dateFormatter = @"yyyy-MM-dd";
                break;
            case DateStyleShowMonthDay:
                _dateFormatter = @"yyyy-MM-dd";
                break;
            case DateStyleShowHourMinute:
                _dateFormatter = @"HH:mm";
                break;
                
            default:
                _dateFormatter = @"yyyy-MM-dd HH:mm";
                break;
        }
        
        [self setupUI];
        [self defaultConfig];
        
        if (completeBlock) {
            self.doneBlock = ^(NSDate *selectDate) {
                completeBlock(selectDate);
            };
        }
    }
    return self;
}

-(void)setupUI {
    self.buttomView.layer.cornerRadius = 10;
    self.buttomView.layer.masksToBounds = YES;
    self.doneButtonColor = RGB(247, 133, 51);
    self.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    //点击背景是否影藏
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    
    self.bottomConstraint.constant = -self.height;
    self.backgroundColor = RGBA(0, 0, 0, 0);
    [self layoutIfNeeded];
    
    
    
    
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
    
    [self.showYearView addSubview:self.datePicker];
    
}

-(void)defaultConfig {
    
    if (!_scrollToDate) {
        _scrollToDate = [NSDate date];
    }
    
    
    //循环滚动时需要用到
    preRow = (self.scrollToDate.year-MINYEAR)*12+self.scrollToDate.month-1;
    
    //设置年月日时分数据
    _yearArray = [self setArray:_yearArray];
    _monthArray = [self setArray:_monthArray];
    _dayArray = [self setArray:_dayArray];
    _hourArray = [self setArray:_hourArray];
    _minuteArray = [self setArray:_minuteArray];
    
    for (int i=0; i<60; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d",i];
        if (0<i && i<=12)
            [_monthArray addObject:num];
        if (i<24)
            [_hourArray addObject:num];
        [_minuteArray addObject:num];
    }
    for (NSInteger i=MINYEAR; i<=MAXYEAR; i++) {
        NSString *num = [NSString stringWithFormat:@"%ld",(long)i];
        [_yearArray addObject:num];
    }
    
    //最大最小限制
    if (!self.maxLimitDate) {
        self.maxLimitDate = [NSDate date:@"2099-12-31 23:59" WithFormat:@"yyyy-MM-dd HH:mm"];
    }
    //最小限制
    if (!self.minLimitDate) {
        self.minLimitDate = [NSDate date:@"0000-01-01 00:00" WithFormat:@"yyyy-MM-dd HH:mm"];
    }
}

-(void)addLabelWithName:(NSArray *)nameArr {
    for (id subView in self.showYearView.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            [subView removeFromSuperview];
        }
    }
    
    if (!_dateLabelColor) {
        _dateLabelColor =  RGB(247, 133, 51);
    }
    
    for (int i=0; i<nameArr.count; i++) {
        CGFloat labelX = kPickerSize.width/(nameArr.count*2)+18+kPickerSize.width/nameArr.count*i;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(labelX, self.showYearView.frame.size.height/2-15/2.0, 15, 15)];
        label.text = nameArr[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor =  _dateLabelColor;
        label.backgroundColor = [UIColor clearColor];
        [self.showYearView addSubview:label];
    }
}


-(void)setDateLabelColor:(UIColor *)dateLabelColor {
    _dateLabelColor = dateLabelColor;
    for (id subView in self.showYearView.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel *label = subView;
            label.textColor = _dateLabelColor;
        }
    }
}


- (NSMutableArray *)setArray:(id)mutableArray
{
    if (mutableArray)
        [mutableArray removeAllObjects];
    else
        mutableArray = [NSMutableArray array];
    return mutableArray;
}

-(void)setYearLabelColor:(UIColor *)yearLabelColor {
    self.showYearView.textColor = yearLabelColor;
}

#pragma mark - UIPickerViewDelegate,UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDayHourMinute:
            [self addLabelWithName:@[@"年",@"月",@"日",@"时",@"分"]];
            return 5;
        case DateStyleShowMonthDayHourMinute:
            [self addLabelWithName:@[@"月",@"日",@"时",@"分"]];
            return 4;
        case DateStyleShowYearMonthDay:
            [self addLabelWithName:@[@"年",@"月",@"日"]];
            return 3;
        case DateStyleShowMonthDay:
            [self addLabelWithName:@[@"月",@"日"]];
            return 2;
        case DateStyleShowHourMinute:
            [self addLabelWithName:@[@"时",@"分"]];
            return 2;
        default:
            return 0;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSArray *numberArr = [self getNumberOfRowsInComponent];
    return [numberArr[component] integerValue];
}

-(NSArray *)getNumberOfRowsInComponent {
    
    NSInteger yearNum = _yearArray.count;
    NSInteger monthNum = _monthArray.count;
    NSInteger dayNum = [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
    NSInteger hourNum = _hourArray.count;
    NSInteger minuteNUm = _minuteArray.count;
    
    NSInteger timeInterval = MAXYEAR - MINYEAR;
    
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDayHourMinute:
            return @[@(yearNum),@(monthNum),@(dayNum),@(hourNum),@(minuteNUm)];
            break;
        case DateStyleShowMonthDayHourMinute:
            return @[@(monthNum*timeInterval),@(dayNum),@(hourNum),@(minuteNUm)];
            break;
        case DateStyleShowYearMonthDay:
            return @[@(yearNum),@(monthNum),@(dayNum)];
            break;
        case DateStyleShowMonthDay:
            return @[@(monthNum*timeInterval),@(dayNum),@(hourNum)];
            break;
        case DateStyleShowHourMinute:
            return @[@(hourNum),@(minuteNUm)];
            break;
        default:
            return @[];
            break;
    }
    
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}


-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *customLabel = (UILabel *)view;
    if (!customLabel) {
        customLabel = [[UILabel alloc] init];
        customLabel.textAlignment = NSTextAlignmentCenter;
        [customLabel setFont:[UIFont systemFontOfSize:17]];
    }
    NSString *title;
    
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDayHourMinute:
            if (component==0) {
                title = _yearArray[row];
            }
            if (component==1) {
                title = _monthArray[row];
            }
            if (component==2) {
                title = _dayArray[row];
            }
            if (component==3) {
                title = _hourArray[row];
            }
            if (component==4) {
                title = _minuteArray[row];
            }
            break;
        case DateStyleShowYearMonthDay:
            if (component==0) {
                title = _yearArray[row];
            }
            if (component==1) {
                title = _monthArray[row];
            }
            if (component==2) {
                title = _dayArray[row];
            }
            break;
        case DateStyleShowMonthDayHourMinute:
            if (component==0) {
                title = _monthArray[row%12];
            }
            if (component==1) {
                title = _dayArray[row];
            }
            if (component==2) {
                title = _hourArray[row];
            }
            if (component==3) {
                title = _minuteArray[row];
            }
            break;
        case DateStyleShowMonthDay:
            if (component==0) {
                title = _monthArray[row%12];
            }
            if (component==1) {
                title = _dayArray[row];
            }
            break;
        case DateStyleShowHourMinute:
            if (component==0) {
                title = _hourArray[row];
            }
            if (component==1) {
                title = _minuteArray[row];
            }
            break;
        default:
            title = @"";
            break;
    }
    
    customLabel.text = title;
    if (!_datePickerColor) {
        _datePickerColor = [UIColor blackColor];
    }
    customLabel.textColor = _datePickerColor;
    return customLabel;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDayHourMinute:{
            
            if (component == 0) {
                yearIndex = row;
                
                self.showYearView.text =_yearArray[yearIndex];
            }
            if (component == 1) {
                monthIndex = row;
            }
            if (component == 2) {
                dayIndex = row;
            }
            if (component == 3) {
                hourIndex = row;
            }
            if (component == 4) {
                minuteIndex = row;
            }
            if (component == 0 || component == 1){
                [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
                
            }
        }
            break;
            
            
        case DateStyleShowYearMonthDay:{
            
            if (component == 0) {
                yearIndex = row;
                self.showYearView.text =_yearArray[yearIndex];
            }
            if (component == 1) {
                monthIndex = row;
            }
            if (component == 2) {
                dayIndex = row;
            }
            if (component == 0 || component == 1){
                [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
        }
            break;
            
            
        case DateStyleShowMonthDayHourMinute:{
            
            
            if (component == 1) {
                dayIndex = row;
            }
            if (component == 2) {
                hourIndex = row;
            }
            if (component == 3) {
                minuteIndex = row;
            }
            
            if (component == 0) {
                
                [self yearChange:row];
                [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
            [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
            
        }
            break;
            
        case DateStyleShowMonthDay:{
            if (component == 1) {
                dayIndex = row;
            }
            if (component == 0) {
                
                [self yearChange:row];
                [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
            }
            [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
        }
            break;
            
        case DateStyleShowHourMinute:{
            if (component == 0) {
                hourIndex = row;
            }
            if (component == 1) {
                minuteIndex = row;
            }
        }
            break;
            
        default:
            break;
    }
    
    [pickerView reloadAllComponents];
    
    NSString *dateStr = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",_yearArray[yearIndex],_monthArray[monthIndex],_dayArray[dayIndex],_hourArray[hourIndex],_minuteArray[minuteIndex]];
    
    self.scrollToDate = [[NSDate date:dateStr WithFormat:@"yyyy-MM-dd HH:mm"] dateWithFormatter:_dateFormatter];
    
    if ([self.scrollToDate compare:self.minLimitDate] == NSOrderedAscending) {
        self.scrollToDate = self.minLimitDate;
        [self getNowDate:self.minLimitDate animated:YES];
    }else if ([self.scrollToDate compare:self.maxLimitDate] == NSOrderedDescending){
        self.scrollToDate = self.maxLimitDate;
        [self getNowDate:self.maxLimitDate animated:YES];
    }
    
    _startDate = self.scrollToDate;
    
}

-(void)yearChange:(NSInteger)row {
    
    monthIndex = row%12;
    
    //年份状态变化
    if (row-preRow <12 && row-preRow>0 && [_monthArray[monthIndex] integerValue] < [_monthArray[preRow%12] integerValue]) {
        yearIndex ++;
    } else if(preRow-row <12 && preRow-row > 0 && [_monthArray[monthIndex] integerValue] > [_monthArray[preRow%12] integerValue]) {
        yearIndex --;
    }else {
        NSInteger interval = (row-preRow)/12;
        yearIndex += interval;
    }
    
    self.showYearView.text = _yearArray[yearIndex];
    
    preRow = row;
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if( [touch.view isDescendantOfView:self.buttomView]) {
        return NO;
    }
    return YES;
}



#pragma mark - Action
-(void)show {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        self.bottomConstraint.constant = 10;
        self.backgroundColor = RGBA(0, 0, 0, 0.4);
        [self layoutIfNeeded];
    }];
}
-(void)dismiss {
    [UIView animateWithDuration:.3 animations:^{
        self.bottomConstraint.constant = -self.height;
        self.backgroundColor = RGBA(0, 0, 0, 0);
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
    }];
}




- (IBAction)doneAction:(UIButton *)btn {
    
    _startDate = [self.scrollToDate dateWithFormatter:_dateFormatter];
    
    self.doneBlock(_startDate);
    [self dismiss];
}

#pragma mark - tools
//通过年月求每月天数
- (NSInteger)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month
{
    NSInteger num_year  = year;
    NSInteger num_month = month;
    
    BOOL isrunNian = num_year%4==0 ? (num_year%100==0? (num_year%400==0?YES:NO):YES):NO;
    switch (num_month) {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:{
            [self setdayArray:31];
            return 31;
        }
        case 4:case 6:case 9:case 11:{
            [self setdayArray:30];
            return 30;
        }
        case 2:{
            if (isrunNian) {
                [self setdayArray:29];
                return 29;
            }else{
                [self setdayArray:28];
                return 28;
            }
        }
        default:
            break;
    }
    return 0;
}

//设置每月的天数数组
- (void)setdayArray:(NSInteger)num
{
    [_dayArray removeAllObjects];
    for (int i=1; i<=num; i++) {
        [_dayArray addObject:[NSString stringWithFormat:@"%02d",i]];
    }
}

//滚动到指定的时间位置
- (void)getNowDate:(NSDate *)date animated:(BOOL)animated
{
    if (!date) {
        date = [NSDate date];
    }
    
    [self DaysfromYear:date.year andMonth:date.month];
    
    yearIndex = date.year-MINYEAR;
    monthIndex = date.month-1;
    dayIndex = date.day-1;
    hourIndex = date.hour;
    minuteIndex = date.minute;
    
    //循环滚动时需要用到
    preRow = (self.scrollToDate.year-MINYEAR)*12+self.scrollToDate.month-1;
    
    NSArray *indexArray;
    
    if (self.datePickerStyle == DateStyleShowYearMonthDayHourMinute)
        indexArray = @[@(yearIndex),@(monthIndex),@(dayIndex),@(hourIndex),@(minuteIndex)];
    if (self.datePickerStyle == DateStyleShowYearMonthDay)
        indexArray = @[@(yearIndex),@(monthIndex),@(dayIndex)];
    if (self.datePickerStyle == DateStyleShowMonthDayHourMinute)
        indexArray = @[@(monthIndex),@(dayIndex),@(hourIndex),@(minuteIndex)];
    if (self.datePickerStyle == DateStyleShowMonthDay)
        indexArray = @[@(monthIndex),@(dayIndex)];
    if (self.datePickerStyle == DateStyleShowHourMinute)
        indexArray = @[@(hourIndex),@(minuteIndex)];
    
    self.showYearView.text = _yearArray[yearIndex];
    
    [self.datePicker reloadAllComponents];
    
    for (int i=0; i<indexArray.count; i++) {
        if ((self.datePickerStyle == DateStyleShowMonthDayHourMinute || self.datePickerStyle == DateStyleShowMonthDay)&& i==0) {
            NSInteger mIndex = [indexArray[i] integerValue]+(12*(self.scrollToDate.year - MINYEAR));
            [self.datePicker selectRow:mIndex inComponent:i animated:animated];
        } else {
            [self.datePicker selectRow:[indexArray[i] integerValue] inComponent:i animated:animated];
        }
        
    }
}


#pragma mark - getter / setter
-(UIPickerView *)datePicker {
    if (!_datePicker) {
        [self.showYearView layoutIfNeeded];
        _datePicker = [[UIPickerView alloc] initWithFrame:self.showYearView.bounds];
        _datePicker.showsSelectionIndicator = YES;
        _datePicker.delegate = self;
        _datePicker.dataSource = self;
    }
    return _datePicker;
}

-(void)setMinLimitDate:(NSDate *)minLimitDate {
    _minLimitDate = minLimitDate;
    if ([_scrollToDate compare:self.minLimitDate] == NSOrderedAscending) {
        _scrollToDate = self.minLimitDate;
    }
    [self getNowDate:self.scrollToDate animated:NO];
}

-(void)setDoneButtonColor:(UIColor *)doneButtonColor {
    _doneButtonColor = doneButtonColor;
    self.doneBtn.backgroundColor = doneButtonColor;
}

@end
