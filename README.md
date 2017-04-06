# DatePicker
日期选择器,日期时间选择,时间选择器


[GitHub: https://github.com/Zws-China/DatePicker](https://github.com/Zws-China/DatePicker)  


# PhotoShoot
![这里写图片描述](http://img.blog.csdn.net/20170406171007690?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)


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
@property (nonatomic, retain) NSDate *maxLimitDate;//限制最大时间（默认9999-12-31 23:59）
@property (nonatomic, retain) NSDate *minLimitDate;//限制最小时间（默认   0-01-01 00:00）

```


## 弹框的类型
```ruby
typedef enum{
DateStyleShowYearMonthDayHourMinute  = 0,    //年月日时分
DateStyleShowMonthDayHourMinute,    //月日时分
DateStyleShowYearMonthDay,    //年月日
DateStyleShowMonthDay,    //月日
DateStyleShowHourMinute    //时分

}WSDateStyle;

```
<br><br>
#### 类型1（DateStyleShowYearMonthDayHourMinute）<br>
![这里写图片描述](http://img.blog.csdn.net/20170406171425510?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

#### 类型2（DateStyleShowMonthDayHourMinute）<br>
![这里写图片描述](http://img.blog.csdn.net/20170406171606527?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

#### 类型3（DateStyleShowYearMonthDay）<br>
![这里写图片描述](http://img.blog.csdn.net/20170406171552762?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

#### 类型4（DateStyleShowMonthDay）<br>
![这里写图片描述](http://img.blog.csdn.net/20170406171721639?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

#### 类型5（DateStyleShowHourMinute）<br>
![这里写图片描述](http://img.blog.csdn.net/20170406171706389?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)