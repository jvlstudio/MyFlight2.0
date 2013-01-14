//
//  TravelAssistantViewController.m
//  MyFlight2.0
//
//  Created by apple on 12-12-19.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import "TravelAssistantViewController.h"
#import "FlightCompanyDistrubuteViewController.h"
#import "AppConfigure.h"
#import "TravelPhoneViewController.h"
#import "FlightCompanyDistrubuteController.h"
#import "TravelTrafficViewController.h"
#import "ChackInNavgationViewController.h"
#import "BaggageViewController.h"
#import "WeatherViewController.h"
#import "UIButton+BackButton.h"
#import "AppDelegate.h"
@interface TravelAssistantViewController ()

@end

@implementation TravelAssistantViewController
@synthesize myAirPortData = _myAirPortData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * cusBtn = [UIButton backButtonType:0 andTitle:@""];
    [cusBtn addTarget:self action:@selector(cusBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:cusBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftItem release];


    
#pragma mark - 读取用户选择的机场信息
    AppDelegate * shareApp = [UIApplication sharedApplication].delegate;
    if (shareApp.TravelAssisData) {
        NSLog(@"not nil");
        self.myAirPortData = shareApp.TravelAssisData;
    }else{
        NSLog(@"data is nil");
    }
    
    
    
    
    
    airPortCode = [[NSString alloc]initWithString:@"PEK"];
    self.view.backgroundColor = FOREGROUND_COLOR;
//    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen]bounds].size.height - 64) style:UITableViewStylePlain];
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 320) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.scrollEnabled = NO;
    myTableView.separatorColor = [UIColor clearColor];
    myTableView.backgroundColor = FOREGROUND_COLOR;
    [self.view addSubview:myTableView];
    
    // Do any additional setup after loading the view from its nib.
    imageArray  = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"icon_Orders.png"], [UIImage imageNamed:@"icon_Traffic.png"], [UIImage imageNamed:@"icon_checkin.png"], [UIImage imageNamed:@"icon_telphone.png"], [UIImage imageNamed:@"icon_Distributed.png"],[UIImage imageNamed:@"icon_Weather.png"],  nil];
    NSLog(@"image count : %d",[imageArray count]);
    titleArray = [[NSArray alloc]initWithObjects:@"机场介绍",@"机场交通",@"值机柜台",@"常用电话",@"航空公司分布",@"天气预报" ,nil];
    
//    UIButton * cusRightBtn = [UIButton backButtonType:4 andTitle:@"选择机场"];
    UIButton * cusRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cusRightBtn setImage:[UIImage imageNamed:@"btn_4words.png"] forState:UIControlStateNormal];
    [cusRightBtn setImage:[UIImage imageNamed:@"btn_4words_click.png"] forState:UIControlStateHighlighted];
    cusRightBtn.frame = CGRectMake(0, 0, 80, 30);
    rightItemTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(2, 2, 76, 26)];
    rightItemTitleLable.backgroundColor = [UIColor clearColor];
    rightItemTitleLable.textColor = [UIColor whiteColor];
    rightItemTitleLable.font = [UIFont systemFontOfSize:15];
    [cusRightBtn addSubview:rightItemTitleLable];
    if (self.myAirPortData.apName) {
        rightItemTitleLable.text = self.myAirPortData.apName;
    }else{
        rightItemTitleLable.text = @"选择机场";
    }
    rightItemTitleLable.textAlignment = NSTextAlignmentCenter;
    

    [cusRightBtn addTarget:self action:@selector(rightItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithCustomView:cusRightBtn];
    self.navigationItem.rightBarButtonItem = right;
    

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    UIView * myBackgroundView = [[UIView alloc]initWithFrame:cell.bounds];
    myBackgroundView.backgroundColor = BACKGROUND_COLOR;
    cell.selectedBackgroundView = myBackgroundView;
    [myBackgroundView release];
    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[imageArray objectAtIndex:indexPath.row]];
    imageView.frame = CGRectMake(10, 11, 22, 22);
    [cell addSubview:imageView];
    [imageView release];
    
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(40, 8, 139, 27)];
    title.text = [titleArray objectAtIndex:indexPath.row];
    title.backgroundColor = [UIColor clearColor];
    title.textColor = FONT_COLOR_DEEP_GRAY;
    [cell addSubview:title];
    [title release];
    
    UIImageView * accessView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrowhead.png"]];
    accessView.frame = CGRectMake(292, 17, 9, 12);
    [cell addSubview:accessView];
    [accessView release];
    
    cell.backgroundColor = [UIColor colorWithRed:247/255.0 green:243/255.0 blue:239/255.0 alpha:1];
    
    UIImageView * bottomLineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 42, 320, 1)];
    bottomLineImageView.backgroundColor = LINE_COLOR;
    [cell addSubview:bottomLineImageView];
    [bottomLineImageView release];
    
    
    UIImageView * bottomLineImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 43, 320, 1)];
    bottomLineImageView1.backgroundColor = [UIColor whiteColor];
    [cell addSubview:bottomLineImageView1];
    [bottomLineImageView1 release];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.myAirPortData == nil) {
        UIAlertView * chooseAirPortAlert = [[UIAlertView alloc]initWithTitle:@"未选择机场" message:@"现在选择机场吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [chooseAirPortAlert show];
        [chooseAirPortAlert release];
    }else{
        if (indexPath.row == 0) {
            NSLog(@"机场介绍");
            FlightCompanyDistrubuteViewController * fcd = [[FlightCompanyDistrubuteViewController alloc]init];
            if (self.myAirPortData) {
                fcd.subAirPortData = self.myAirPortData;
                NSLog(@"");
            }
            [self.navigationController pushViewController:fcd animated:YES];
            [fcd release];
        }else if (indexPath.row == 1){
            NSLog(@"机场交通");
            TravelTrafficViewController * ttvc = [[TravelTrafficViewController alloc]init];
            if (self.myAirPortData) {
                ttvc.subAirPortData = self.myAirPortData;
                ttvc.airPortName = self.myAirPortData.apName;
            }else{
                ttvc.airPortCode = airPortCode;
            }
            [self.navigationController pushViewController:ttvc  animated:YES];
            [ttvc release];
        }else if (indexPath.row == 2){
            NSLog(@"值机柜台");
            ChackInNavgationViewController * cinav = [[ChackInNavgationViewController alloc]init];
            cinav.subAirPortData = self.myAirPortData;
            cinav.airPortCode = self.myAirPortData.apCode;
            cinav.myTitle = self.myAirPortData.apName;
            [self.navigationController pushViewController:cinav animated:YES];
            [cinav release];
        }else if (indexPath.row == 3){
            NSLog(@"常用电话");
            TravelPhoneViewController * tpvc = [[TravelPhoneViewController alloc]init];
            tpvc.subAirPortData = self.myAirPortData;
            [self.navigationController pushViewController:tpvc animated:YES];
            [tpvc release];
            
        }else if (indexPath.row == 4){
            NSLog(@"航空公司分布");
            FlightCompanyDistrubuteController * fcdc = [[FlightCompanyDistrubuteController alloc]init];
            fcdc.subAirPortData = self.myAirPortData;
            fcdc.airPortCode = self.myAirPortData.apCode;
            
            fcdc.myTitle = self.myAirPortData.apName;
            [self.navigationController pushViewController:fcdc animated:YES];
            [fcdc release];
        }else if(indexPath.row == 5){
            NSLog(@"天气预报");
            WeatherViewController * weather = [[WeatherViewController alloc]init];
            weather.subAirPortData = self.myAirPortData;
            [self.navigationController pushViewController:weather animated:YES];
            [weather release];
            
        }
    }
}

-(void)rightItemClick:(id)arg{
    ChooseAirPortViewController *controller = [[ChooseAirPortViewController alloc] init];
    //默认出发机场
    controller.startAirportName = @"";
    //默认到达机场
    controller.endAirPortName = @"";
    //选择的类型
    controller.choiceTypeOfAirPort = START_AIRPORT_TYPE;
    controller.delegate =self;
    
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void) ChooseAirPortViewController:(ChooseAirPortViewController *) controlelr chooseType:(NSInteger ) choiceType didSelectAirPortInfo:(AirPortData *) airPort{
    self.myAirPortData = airPort;
    NSLog(@"myairPortData : %@",self.myAirPortData.apCode);
    rightItemTitleLable.text = airPort.apName;
    
    AppDelegate * shareApp = [UIApplication sharedApplication].delegate;
    shareApp.TravelAssisData = airPort;

}

#pragma mark - alert代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%d",buttonIndex);
    if (buttonIndex == 1) {
        ChooseAirPortViewController *controller = [[ChooseAirPortViewController alloc] init];
        //默认出发机场
        controller.startAirportName = @"";
        //默认到达机场
        controller.endAirPortName = @"";
        //选择的类型
        controller.choiceTypeOfAirPort = START_AIRPORT_TYPE;
        controller.delegate =self;
        
        [self.navigationController pushViewController:controller animated:YES];
        [controller release];
    }
}

-(void)cusBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dealloc{
    [airPortCode release];
    [myTableView release];
    [titleArray release];
    [imageArray release];
    [super dealloc];
}
@end
