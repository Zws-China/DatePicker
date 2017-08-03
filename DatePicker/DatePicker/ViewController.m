//
//  ViewController.m
//  DatePicker
//
//  Created by iMac on 17/2/23.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "ViewController.h"
#import "WSDatePickerView.h"

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
    

}

- (void)selectAction:(UIButton *)btn {

//_________________________年-月-日-时-分____________________________________________

    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {
        
        NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
        NSLog(@"选择的日期：%@",date);
        [btn setTitle:date forState:UIControlStateNormal];
        
    }];
    datepicker.dateLabelColor = [UIColor redColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
    [datepicker show];
    
//________________________________________________________________________________

    
    
    
    
    
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
//________________________________________________________________________________

    
    
    
    
    
    
//_________________________年-月-日_______________________________________________
    /*
    
     
     WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
     
     NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd"];
     NSLog(@"选择的年月日：%@",date);
     [btn setTitle:date forState:UIControlStateNormal];
     
     }];
     [datepicker show];
     
     */
//________________________________________________________________________________
 
   
    
    
    
    
    
//_________________________月-日_______________________________________________
    
     /*
     WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonthDay CompleteBlock:^(NSDate *selectDate) {
     
     NSString *date = [selectDate stringWithFormat:@"MM-dd"];
     NSLog(@"选择的月日：%@",date);
     [btn setTitle:date forState:UIControlStateNormal];
     
     }];
     [datepicker show];
     */
     
//_____________________________________________________________________________
    
    
    
    
    
    
    

    
//_________________________月-日_______________________________________________
    
    /*
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowHourMinute CompleteBlock:^(NSDate *selectDate) {
        
        NSString *date = [selectDate stringWithFormat:@"HH:mm"];
        NSLog(@"选择的时分：%@",date);
        [btn setTitle:date forState:UIControlStateNormal];
        
    }];
    [datepicker show];
    */
    
//_____________________________________________________________________________
    
}






@end
