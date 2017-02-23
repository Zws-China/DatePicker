# DatePicker
日期选择器,日期时间选择,时间选择器


[GitHub: https://github.com/Zws-China/DatePicker](https://github.com/Zws-China/DatePicker)  


# PhotoShoot
![image](https://github.com/Zws-China/.../blob/master/datepicker.gif)


# How To Use

```ruby

WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithCompleteBlock:^(NSDate *startDate) {
    NSString *date = [startDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
    NSLog(@"时间： %@",date);
}];
    datepicker.datePickerStyle = DateStyleShowYearMonthDayHourMinute;
    [datepicker show];

```