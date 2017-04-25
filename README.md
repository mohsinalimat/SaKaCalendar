# SaKaCalendar
自定义日历,农历和阳历同时显示. 

接口:
/**
* showChineseCalendar：显示农历， 默认为YES
*/
@property (nonatomic ,assign)BOOL showChineseCalendar;

/**
* 日期选择回调
* year：年
* month：月
* day：日
*/
- (void)selectDateOfMonth:(void(^)(NSInteger year,NSInteger month,NSInteger day))selectBlock;


代码示例:
SaKaCalendar *calendar = [[SaKaCalendar alloc]initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.bounds)-40, 300)];
[self.view addSubview:calendar];

calendar.showChineseCalendar = YES;
[calendar selectDateOfMonth:^(NSInteger year, NSInteger month, NSInteger day) {
NSLog(@"%ld年/%ld月/%ld日",(long)year,(long)month,(long)day);
}];

