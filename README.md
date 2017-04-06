# DatePicker
日期选择器,日期时间选择,时间选择器


[GitHub: https://github.com/Zws-China/DatePicker](https://github.com/Zws-China/DatePicker)  


# PhotoShoot
![image](https://github.com/Zws-China/.../blob/master/datepicker.gif)


# How To Use

```ruby

WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *startDate) {
NSString *date = [startDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
NSLog(@"时间： %@",date);
[btn setTitle:date forState:UIControlStateNormal];

}];
datepicker.doneButtonColor = [UIColor purpleColor];//确定按钮的颜色
[datepicker show];



可设置的属性
@property (nonatomic,strong)UIColor *doneButtonColor;//按钮颜色
@property (nonatomic, retain) NSDate *maxLimitDate;//限制最大时间（没有设置默认9999）
@property (nonatomic, retain) NSDate *minLimitDate;//限制最小时间（没有设置默认0）


```