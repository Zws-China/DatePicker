# DatePicker
日期选择器,日期时间选择,时间选择器,年月日时分


[GitHub: https://github.com/Zws-China/DatePicker](https://github.com/Zws-China/DatePicker)


# PhotoShoot
![这里写图片描述](https://github.com/Zws-China/.../blob/master/datepicker1.png)


## 可设置属性
```ruby
宏定义
#define RGB(x,y,z) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1.0]


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

//大号年份字体颜色(默认灰色)想隐藏可以设置为clearColor
@property (nonatomic, retain) UIColor *yearLabelColor;

//默认滚动到当前时间
-(instancetype)initWithDateStyle:(WSDateStyle)datePickerStyle CompleteBlock:(void(^)(NSDate *))completeBlock;

//滚动到指定的的日期
-(instancetype)initWithDateStyle:(WSDateStyle)datePickerStyle scrollToDate:(NSDate *)scrollToDate CompleteBlock:(void(^)(NSDate *))completeBlock;


```


## 弹框的类型
```ruby
typedef enum{
DateStyleShowYearMonthDayHourMinute  = 0,//年月日时分
DateStyleShowMonthDayHourMinute,//月日时分
DateStyleShowYearMonthDay,//年月日
DateStyleShowYearMonth,//年月
DateStyleShowMonthDay,//月日
DateStyleShowHourMinute,//时分
DateStyleShowYear,//年
DateStyleShowMonth,//月
DateStyleShowDayHourMinute,//日时分
}WSDateStyle;

```
<br><br>
#### 类型1（DateStyleShowYearMonthDayHourMinute）<br>
```ruby
//_________________________年-月-日-时-分____________________________________________
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {

NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
NSLog(@"选择的日期：%@",date);
}];
datepicker.dateLabelColor = [UIColor orangeColor];//年-月-日-时-分 颜色
datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
[datepicker show];



//_________________________年-月-日-时-分（滚动到指定的日期）_________________________
NSDateFormatter *minDateFormater = [[NSDateFormatter alloc] init];
[minDateFormater setDateFormat:@"yyyy-MM-dd HH:mm"];
NSDate *scrollToDate = [minDateFormater dateFromString:@"2011-11-11 11:11"];

WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute scrollToDate:scrollToDate CompleteBlock:^(NSDate *selectDate) {

NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
NSLog(@"选择的日期：%@",date);
}];
datepicker.dateLabelColor = RGB(65, 188, 241);//年-月-日-时-分 颜色
datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
datepicker.doneButtonColor = RGB(65, 188, 241);//确定按钮的颜色
datepicker.yearLabelColor = [UIColor clearColor];//大号年份字体颜色
[datepicker show];

```
![这里写图片描述](https://github.com/Zws-China/.../blob/master/datepicker1.png)

#### 类型2（DateStyleShowMonthDayHourMinute）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {

NSString *date = [selectDate stringWithFormat:@"MM-dd HH:mm"];
NSLog(@"选择的月日时分：%@",date);

}];
[datepicker show];

```
![这里写图片描述](https://github.com/Zws-China/.../blob/master/datepicker2.png)

#### 类型3（DateStyleShowYearMonthDay）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {

NSString *date = [selectDate stringWithFormat:@"yyyy-MM-dd"];
NSLog(@"选择的年月日：%@",date);

}];
[datepicker show];

```
![这里写图片描述](https://github.com/Zws-China/.../blob/master/datepicker3.png)

#### 类型4（DateStyleShowMonthDay）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonthDay CompleteBlock:^(NSDate *selectDate) {

NSString *date = [selectDate stringWithFormat:@"MM-dd"];
NSLog(@"选择的月日：%@",date);

}];
[datepicker show];

```
![这里写图片描述](https://github.com/Zws-China/.../blob/master/datepicker4.png)

#### 类型5（DateStyleShowHourMinute）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowHourMinute CompleteBlock:^(NSDate *selectDate) {

NSString *date = [selectDate stringWithFormat:@"HH:mm"];
NSLog(@"选择的时分：%@",date);

}];
[datepicker show];

```
![这里写图片描述](https://github.com/Zws-China/.../blob/master/datepicker5.png)


#### 类型6（DateStyleShowYear）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYear CompleteBlock:^(NSDate *selectDate) {

NSString *date = [selectDate stringWithFormat:@"yyyy"];
NSLog(@"选择的：%@",date);

}];
[datepicker show];

```
![image](https://raw.githubusercontent.com/Zws-China/.../master/111.png)

#### 类型7（DateStyleShowMonth）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowMonth CompleteBlock:^(NSDate *selectDate) {

NSString *date = [selectDate stringWithFormat:@"MM"];
NSLog(@"选择的：%@",date);

}];
[datepicker show];

```
![image](https://github.com/Zws-China/.../blob/master/222.png?raw=true)

#### 类型8（DateStyleShowDayHourMinute）<br>
```ruby
WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowDayHourMinute CompleteBlock:^(NSDate *selectDate) {

NSString *date = [selectDate stringWithFormat:@"dd HH:mm"];
NSLog(@"选择的：%@",date);

}];
[datepicker show];

```
![image](https://github.com/Zws-China/.../blob/master/333.png?raw=true)


#### github下载地址：[https://github.com/Zws-China/DatePicker](https://github.com/Zws-China/DatePicker)

如果觉得对你还有些用，顺手点一下star吧 (｡♥‿♥｡)   你的支持是我继续的动力。<br>
