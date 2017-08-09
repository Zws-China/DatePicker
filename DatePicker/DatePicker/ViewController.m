//
//  ViewController.m
//  DatePicker
//
//  Created by iMac on 17/2/23.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "ViewController.h"
#import "WSDatePickerView.h"
#define RGB(x,y,z) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(20, 100, self.view.frame.size.width-40, 50);
    selectBtn.layer.cornerRadius = 5;
    selectBtn.backgroundColor = [UIColor lightGrayColor];
    [selectBtn setTitle:@"选择时间" forState:UIControlStateNormal];
    [self.view addSubview:selectBtn];
    [selectBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *selectBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn2.frame = CGRectMake(20, 200, self.view.frame.size.width-40, 50);
    selectBtn2.layer.cornerRadius = 5;
    selectBtn2.backgroundColor = [UIColor lightGrayColor];
    [selectBtn2 setTitle:@"弹出指定日期2011-11-11 11:11" forState:UIControlStateNormal];
    [self.view addSubview:selectBtn2];
    [selectBtn2 addTarget:self action:@selector(selectAction2:) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)selectAction:(UIButton *)btn {

//_________________________年-月-日-时-分____________________________________________

     WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {
     
     NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
     NSLog(@"选择的日期：%@",date);
     [btn setTitle:date forState:UIControlStateNormal];
     
     }];
     datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
     datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
     datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
     [datepicker show];

    
    
    
    
    
//_________________________月-日-时-分____________________________________________

    /*
     
     //月-日-时-分
     WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {
     
     NSString *date = [selectDate stringWithFormat:@"MM-dd HH:mm"];
     NSLog(@"选择的月日时分：%@",date);
     [btn setTitle:date forState:UIControlStateNormal];
     
     }];
     [datepicker show];

     */

    
    
    
    
    
    
//_________________________年-月-日_______________________________________________
    /*
    
     
     WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
     
     NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd"];
     NSLog(@"选择的年月日：%@",date);
     [btn setTitle:date forState:UIControlStateNormal];
     
     }];
     [datepicker show];
     
     */
 
   
    
    
    
    
    
//_________________________月-日_______________________________________________
    
     /*
     WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonthDay CompleteBlock:^(NSDate *selectDate) {
     
     NSString *date = [selectDate stringWithFormat:@"MM-dd"];
     NSLog(@"选择的月日：%@",date);
     [btn setTitle:date forState:UIControlStateNormal];
     
     }];
     [datepicker show];
     */
     
    
    
    
    
    
    
    

    
//_________________________时-分_______________________________________________
    
    /*
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowHourMinute CompleteBlock:^(NSDate *selectDate) {
        
        NSString *date = [selectDate stringWithFormat:@"HH:mm"];
        NSLog(@"选择的时分：%@",date);
        [btn setTitle:date forState:UIControlStateNormal];
        
    }];
    [datepicker show];
    */
    
    
}

- (void)selectAction2:(UIButton *)btn {
    //_________________________年-月-日-时-分（滚动到指定的日期）_________________________
    NSDateFormatter *minDateFormater = [[NSDateFormatter alloc] init];
    [minDateFormater setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *scrollToDate = [minDateFormater dateFromString:@"2011-11-11 11:11"];
    
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute scrollToDate:scrollToDate CompleteBlock:^(NSDate *selectDate) {
        
        NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
        NSLog(@"选择的日期：%@",date);
        [btn setTitle:date forState:UIControlStateNormal];
        
    }];
    datepicker.dateLabelColor = RGB(65, 188, 241);//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = RGB(65, 188, 241);//确定按钮的颜色
    datepicker.yearLabelColor = [UIColor clearColor];//大号年份字体颜色
    [datepicker show];
    
}





@end
