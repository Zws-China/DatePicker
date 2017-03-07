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
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithCompleteBlock:^(NSDate *startDate) {
        NSString *date = [startDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
        NSLog(@"时间： %@",date);
        [btn setTitle:date forState:UIControlStateNormal];

    }];
    datepicker.datePickerStyle = DateStyleShowYearMonthDay;
    datepicker.minLimitDate = [NSDate date:@"1970-1-01 00:00" WithFormat:@"yyyy-MM-dd HH:mm"];
    datepicker.maxLimitDate = [NSDate date:@"2049-12-31 23:59" WithFormat:@"yyyy-MM-dd HH:mm"];
    [datepicker show];
    
}






@end
