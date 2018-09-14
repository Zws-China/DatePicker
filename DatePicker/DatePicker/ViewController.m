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

#define randomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    

    NSArray *arr = @[@"年-月-日-时-分",@"月-日-时-分",@"年-月-日",@"年-月",@"月-日",@"时-分",@"年",@"月",@"指定日期2011-11-11 11:11",@"日-时-分"];
    for (NSInteger i = 0; i < arr.count; i++) {
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        selectBtn.frame = CGRectMake(20, 40+50*i, self.view.frame.size.width-40, 40);
        selectBtn.tag = i;
        selectBtn.layer.cornerRadius = 5;
        selectBtn.backgroundColor = [UIColor lightGrayColor];
        [selectBtn setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
        [self.view addSubview:selectBtn];
        [selectBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    }

    

}

- (void)selectAction:(UIButton *)btn {

    switch (btn.tag) {
        case 0:
        {
            //年-月-日-时-分
            WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {
                
                NSString *dateString = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
                NSLog(@"选择的日期：%@",dateString);
                [btn setTitle:dateString forState:UIControlStateNormal];
            }];
            datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
            datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
            datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
            [datepicker show];
        }
            break;
        case 1:
        {
            //月-日-时-分
            WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {
                
                NSString *dateString = [selectDate stringWithFormat:@"MM-dd HH:mm"];
                NSLog(@"选择的日期：%@",dateString);
                [btn setTitle:dateString forState:UIControlStateNormal];
            }];
            datepicker.dateLabelColor = [UIColor purpleColor];//年-月-日-时-分 颜色
            datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
            datepicker.doneButtonColor = [UIColor purpleColor];//确定按钮的颜色
            [datepicker show];
            
        }
            break;
        case 2:
        {
            //年-月-日
            WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
                
                NSString *dateString = [selectDate stringWithFormat:@"yyyy-MM-dd"];
                NSLog(@"选择的日期：%@",dateString);
                [btn setTitle:dateString forState:UIControlStateNormal];
            }];
            datepicker.dateLabelColor = randomColor;//年-月-日-时-分 颜色
            datepicker.datePickerColor = randomColor;//滚轮日期颜色
            datepicker.doneButtonColor = randomColor;//确定按钮的颜色
            [datepicker show];
        }
            break;
        case 3:
        {
            //年-月
            WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonth CompleteBlock:^(NSDate *selectDate) {
                
                NSString *dateString = [selectDate stringWithFormat:@"yyyy-MM"];
                NSLog(@"选择的日期：%@",dateString);
                [btn setTitle:dateString forState:UIControlStateNormal];
            }];
            datepicker.dateLabelColor = randomColor;//年-月-日-时-分 颜色
            datepicker.datePickerColor = randomColor;//滚轮日期颜色
            datepicker.doneButtonColor = randomColor;//确定按钮的颜色
            [datepicker show];
            
        }
            break;
        case 4:
        {
            //月-日
            WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonthDay CompleteBlock:^(NSDate *selectDate) {
                
                NSString *dateString = [selectDate stringWithFormat:@"MM-dd"];
                NSLog(@"选择的日期：%@",dateString);
                [btn setTitle:dateString forState:UIControlStateNormal];
            }];
            datepicker.dateLabelColor = randomColor;//年-月-日-时-分 颜色
            datepicker.datePickerColor = randomColor;//滚轮日期颜色
            datepicker.doneButtonColor = randomColor;//确定按钮的颜色
            [datepicker show];
            
        }
            break;
        case 5:
        {
            //时-分
            WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowHourMinute CompleteBlock:^(NSDate *selectDate) {
                
                NSString *dateString = [selectDate stringWithFormat:@"HH:mm"];
                NSLog(@"选择的日期：%@",dateString);
                [btn setTitle:dateString forState:UIControlStateNormal];
            }];
            datepicker.dateLabelColor = randomColor;//年-月-日-时-分 颜色
            datepicker.datePickerColor = randomColor;//滚轮日期颜色
            datepicker.doneButtonColor = randomColor;//确定按钮的颜色
            datepicker.yearLabelColor = [UIColor cyanColor];//大号年份字体颜色
            [datepicker show];
            
        }
            break;
        case 6:
        {
            //年
            WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYear CompleteBlock:^(NSDate *selectDate) {
                
                NSString *dateString = [selectDate stringWithFormat:@"yyyy"];
                NSLog(@"选择的日期：%@",dateString);
                [btn setTitle:dateString forState:UIControlStateNormal];
            }];
            datepicker.dateLabelColor = randomColor;//年-月-日-时-分 颜色
            datepicker.datePickerColor = randomColor;//滚轮日期颜色
            datepicker.doneButtonColor = randomColor;//确定按钮的颜色
            [datepicker show];
        }
            break;
        case 7:
        {
            //月
            WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonth CompleteBlock:^(NSDate *selectDate) {
                
                NSString *dateString = [selectDate stringWithFormat:@"MM"];
                NSLog(@"选择的日期：%@",dateString);
                [btn setTitle:dateString forState:UIControlStateNormal];
            }];
            datepicker.dateLabelColor = randomColor;//年-月-日-时-分 颜色
            datepicker.datePickerColor = randomColor;//滚轮日期颜色
            datepicker.doneButtonColor = randomColor;//确定按钮的颜色
            [datepicker show];
        }
            break;
        case 8:
        {
            //指定日期2011-11-11 11:11
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
            datepicker.hideBackgroundYearLabel = YES;//隐藏背景年份文字
            [datepicker show];
        }
            break;
        case 9:
        {
            //日-时-分
            WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowDayHourMinute CompleteBlock:^(NSDate *selectDate) {
                
                NSString *dateString = [selectDate stringWithFormat:@"dd HH:mm"];
                NSLog(@"选择的日期：%@",dateString);
                [btn setTitle:dateString forState:UIControlStateNormal];
            }];
            datepicker.dateLabelColor = randomColor;//年-月-日-时-分 颜色
            datepicker.datePickerColor = randomColor;//滚轮日期颜色
            datepicker.doneButtonColor = randomColor;//确定按钮的颜色
            [datepicker show];
        }
            break;
        default:
            break;
    }

    
}





@end
