//
//  CalculatorView.m
//  Calculator
//
//  Created by 小哲的DELL on 2018/9/27.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "CalculatorView.h"

@interface CalculatorView () <UITableViewDelegate, UITableViewDataSource>
    
@end

@implementation CalculatorView


- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor blackColor];
        self.array = [[NSMutableArray alloc] init];
        [self initDataSource];
        
    //    历史历史历史
       // self.historyTable = [[UITableView alloc]initWithFrame:CGRectMake(18, 720, 400, 163) style:UITableViewStyleGrouped];
         self.historyTable = [[UITableView alloc]initWithFrame:CGRectMake(18, 18, self.frame.size.width-18, self.frame.size.height-18) style:UITableViewStyleGrouped];
       
        
        [self.historyTable setBackgroundColor:[UIColor blackColor]];
        UITableView* tbv = self.historyTable;
        tbv.delegate = self;
        tbv.dataSource = self;
        
        //
        [self addSubview:self.historyTable];
        
        tbv.sectionIndexBackgroundColor = [UIColor blackColor];
        tbv.sectionIndexTrackingBackgroundColor = [UIColor blackColor];
       
        //textView
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, 414, 203)];
        self.textView.backgroundColor = [UIColor blackColor];
        self.textView.textAlignment = NSTextAlignmentRight;
        self.textView.editable = NO;
        self.textView.textColor = [UIColor whiteColor];
        self.textView.scrollEnabled = NO;
        [self addSubview:self.textView];
        
        //textField
//        self.textField = [[UITextField alloc] init];
//        self.textField.backgroundColor = [UIColor blackColor];
//        self.textField.textAlignment = NSTextAlignmentRight;
//        self.textField.enabled = NO;
//        self.textField.textColor = [UIColor whiteColor];
//        self.textField.text = @"1";
//        [self addSubview:self.textField];
        
        //.
        self.pointButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.pointButton.tag = 99;
        [self.pointButton setTitle:@"." forState:UIControlStateNormal];
        [self addSubview:self.pointButton];
        
        //0
        self.button0 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button0.tag = 100;
        [self.button0 setTitle:@"0" forState:UIControlStateNormal];
        [self addSubview:self.button0];
        
        //1
        self.button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button1.tag = 101;
        [self.button1 setTitle:@"1" forState:UIControlStateNormal];
        [self addSubview:self.button1];
        
        //2
        self.button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button2.tag = 102;
        [self.button2 setTitle:@"2" forState:UIControlStateNormal];
        [self addSubview:self.button2];
        
        //3
        self.button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button3.tag = 103;
        [self.button3 setTitle:@"3" forState:UIControlStateNormal];
        [self addSubview:self.button3];
        
        //4
        self.button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button4.tag = 104;
        [self.button4 setTitle:@"4" forState:UIControlStateNormal];
        [self addSubview:self.button4];
        
        //5
        self.button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button5.tag = 105;
        [self.button5 setTitle:@"5" forState:UIControlStateNormal];
        [self addSubview:self.button5];
        
        //6
        self.button6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button6.tag = 106;
        [self.button6 setTitle:@"6" forState:UIControlStateNormal];
        [self addSubview:self.button6];
        
        //7
        self.button7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button7.tag = 107;
        [self.button7 setTitle:@"7" forState:UIControlStateNormal];
        [self addSubview:self.button7];
        
        //8
        self.button8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button8.tag = 108;
        [self.button8 setTitle:@"8" forState:UIControlStateNormal];
        [self addSubview:self.button8];
        
        //9
        self.button9 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button9.tag = 109;
        [self.button9 setTitle:@"9" forState:UIControlStateNormal];
        [self addSubview:self.button9];
        
        //AC
        self.acButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.acButton.tag = 110;
        [self.acButton setTitle:@"AC" forState:UIControlStateNormal];
        [self addSubview:self.acButton];
        
        //（
        self.leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.leftButton.tag = 111;
        [self.leftButton setTitle:@"(" forState:UIControlStateNormal];
        [self addSubview:self.leftButton];
        
        //)
        self.rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.rightButton.tag = 112;
        [self.rightButton setTitle:@")" forState:UIControlStateNormal];
        [self addSubview:self.rightButton];
        
        //+
        self.plusButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.plusButton.tag = 113;
        [self.plusButton setTitle:@"+" forState:UIControlStateNormal];
        [self addSubview:self.plusButton];
        
        //-
        self.minusButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.minusButton.tag = 114;
        [self.minusButton setTitle:@"-" forState:UIControlStateNormal];
        [self addSubview:self.minusButton];
        
        //×
        self.multiplyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.multiplyButton.tag = 115;
        [self.multiplyButton setTitle:@"×" forState:UIControlStateNormal];
        [self addSubview:self.multiplyButton];
        
        //÷
        self.divideButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.divideButton.tag = 116;
        [self.divideButton setTitle:@"÷" forState:UIControlStateNormal];
        [self addSubview:self.divideButton];
        
        //=
        self.equalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.equalButton.tag = 117;
        [self.equalButton setTitle:@"=" forState:UIControlStateNormal];
        [self addSubview:self.equalButton];
        
        //history
        self.history = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.history.tag = 118;
        [self.history setTitle:@"历史" forState:UIControlStateNormal];
        [self addSubview:self.history];
        
        
        //returnHome
        self.returnHome = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.returnHome.tag = 119;
        [self.returnHome setTitle:@"返回" forState:(UIControlStateNormal)];
                 [self.returnHome setBackgroundColor:[UIColor whiteColor]];
                 [self.returnHome addTarget:self action:@selector(goHome) forControlEvents:(UIControlEventTouchUpInside)];
        [self.historyTable addSubview:self.returnHome];
         
        
        for (UIButton *button in [self subviews]) {
            if (![button isKindOfClass:[UIButton class]]) {
                continue;
            }
            if(button.tag >= 99 && button.tag <= 109){
                [button setTintColor:[UIColor whiteColor]];
                button.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
            }
            if(button.tag >= 110 && button.tag <= 112){
                [button setTintColor:[UIColor blackColor]];
                button.backgroundColor = [UIColor colorWithRed:0.65f green:0.65f blue:0.65f alpha:1.00f];
            }
            if(button.tag >= 113){
                [button setTintColor:[UIColor whiteColor]];
                button.backgroundColor = [UIColor colorWithRed:0.96f green:0.53f blue:0.00f alpha:1.00f];
            }
            if(button.tag!=119)
            button.titleLabel.font = [UIFont systemFontOfSize:32];
            else button.titleLabel.font = [UIFont systemFontOfSize:15];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 5.0;
            
        }
         //历史历史历史
        
    }
    return self;
}
-(void)goHome
{
    [self sendSubviewToBack:self.historyTable];
    self.returnHome.hidden = 1;
    self.historyTable.hidden = 1;
}

- (void)initDataSource {
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    self.textView.frame = CGRectMake(0, 20, 414, 203);
//    self.textField.frame = CGRectMake(0, 20, 414, 203);
    
    //第一行
    self.acButton.frame = CGRectMake(18, 241+90, 90, 90);
    self.leftButton.frame = CGRectMake(18+99, 241+90, 90, 90);
    self.rightButton.frame = CGRectMake(18+99*2, 241+90, 90, 90);
    self.divideButton.frame = CGRectMake(18+99*3, 241+90, 90, 90);
    
    //第二行
    self.button7.frame = CGRectMake(18, 340+90, 90, 90);
    self.button8.frame = CGRectMake(18+99, 340+90, 90, 90);
    self.button9.frame = CGRectMake(18+99*2, 340+90, 90, 90);
    self.multiplyButton.frame = CGRectMake(18+99*3, 340+90, 90, 90);
    
    //第三行
    self.button4.frame = CGRectMake(18, 439+90, 90, 90);
    self.button5.frame = CGRectMake(18+99, 439+90, 90, 90);
    self.button6.frame = CGRectMake(18+99*2, 439+90, 90, 90);
    self.minusButton.frame = CGRectMake(18+99*3, 439+90, 90, 90);
    
    //第四行
    self.button1.frame = CGRectMake(18, 538+90, 90, 90);
    self.button2.frame = CGRectMake(18+99, 538+90, 90, 90);
    self.button3.frame = CGRectMake(18+99*2, 538+90, 90, 90);
    self.plusButton.frame = CGRectMake(18+99*3, 538+90, 90, 90);
    
    //第五行
    self.button0.frame = CGRectMake(18, 637+90, 90, 90);
    self.pointButton.frame = CGRectMake(18+99, 637+90, 90, 90);
    self.equalButton.frame = CGRectMake(18+99*2, 637+90, 90, 90);
    self.history.frame = CGRectMake(18+99*3, 637+90, 90, 90);
    
    [self.returnHome setBackgroundColor:[UIColor blackColor]];
    self.returnHome.frame = CGRectMake(18+99*3+10,18,40,20);
   // [self.historyTable addSubview:self.returnHome];
    
}

- (void)insertOneHistory:(NSString *)calText {
    if (calText.length <= 0) {
        return;
    }
    
    //修改数据源
    [self.array insertObject:calText atIndex:0];
//    [self.historyTable reloadData];
   // NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //[self.historyTable insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.historyTable reloadData];
}

//数据源代理方法
//数据源代理方法
 
/**
 *  告诉tableView一共有多少组数据,默认为1组
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     
    return 1;
}
 
/**
 *  告诉tableView第section组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     
    return self.array.count;
}
 
/**
 *  告诉tableView第indexPath行显示怎样的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 0.重用标识
    // 被static修饰的局部变量：只会初始化一次，在整个程序运行过程中，只有一份内存
    static NSString *ID = @"cell";
     
    // 1.先根据cell的标识去缓存池中查找可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
     
    // 2.如果cell为nil（缓存池找不到对应的cell）
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 3.覆盖数据
    NSString *calText = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", calText];
    cell.contentView.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    
    return cell;
}
 
/**
 *  告诉tableView第section组的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
     
    return @"";
}




/**
 *  告诉tableView第section组的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
     
    return @"";
}
@end
