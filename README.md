# DatePicker
日期选择器,日期时间选择,时间选择器,年月日时分


[GitHub: https://github.com/Zws-China/DatePicker](https://github.com/Zws-China/DatePicker)  


# PhotoShoot
![这里写图片描述](http://img.blog.csdn.net/20170406171007690?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)


## 可设置属性
```ruby

可设置的属性

//确定按钮颜色
@property (nonatomic,strong)UIColor *doneButtonColor;

//年-月-日-时-分 文字颜色(默认橙色)
@property (nonatomic,strong)UIColor *dateLabelColor;

//滚轮日期颜色(默认黑色)
@property (nonatomic,strong)UIColor *datePickerColor;

//限制最大时间（默认2099）datePicker大于最大日期则滚动回最大限制日期
@property (nonatomic, retain) NSDate *maxLimitDate;

//限制最小时间（默认0） datePicker小于最小日期则滚动回最小限制日期
@property (nonatomic, retain) NSDate *minLimitDate;


```


## 弹框的类型
```ruby
typedef enum{
DateStyleShowYearMonthDayHourMinute  = 0,    //年-月-日-时-分
DateStyleShowMonthDayHourMinute,             //月-日-时-分
DateStyleShowYearMonthDay,                   //年-月-日
DateStyleShowMonthDay,                       //月-日
DateStyleShowHourMinute                      //时-分

}WSDateStyle;

```
<br><br>
#### 类型1（DateStyleShowYearMonthDayHourMinute）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {

    NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
    NSLog(@"选择的日期：%@",date);

}];
datepicker.dateLabelColor = [UIColor redColor];//年-月-日-时-分 颜色
datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
[datepicker show];
```
![这里写图片描述](http://img.blog.csdn.net/20170406171425510?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

#### 类型2（DateStyleShowMonthDayHourMinute）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {

    NSString *date = [selectDate stringWithFormat:@"MM-dd HH:mm"];
    NSLog(@"选择的月日时分：%@",date);

}];
[datepicker show];

```
![这里写图片描述](http://img.blog.csdn.net/20170406171606527?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

#### 类型3（DateStyleShowYearMonthDay）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {

    NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd"];
    NSLog(@"选择的年月日：%@",date);

}];
[datepicker show];

```
![这里写图片描述](http://img.blog.csdn.net/20170406171552762?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

#### 类型4（DateStyleShowMonthDay）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonthDay CompleteBlock:^(NSDate *selectDate) {

    NSString *date = [selectDate stringWithFormat:@"MM-dd"];
    NSLog(@"选择的月日：%@",date);

}];
[datepicker show];

```
![这里写图片描述](http://img.blog.csdn.net/20170406171721639?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

#### 类型5（DateStyleShowHourMinute）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowHourMinute CompleteBlock:^(NSDate *selectDate) {

    NSString *date = [selectDate stringWithFormat:@"HH:mm"];
    NSLog(@"选择的时分：%@",date);

}];
[datepicker show];

```
![这里写图片描述](http://img.blog.csdn.net/20170406171706389?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)