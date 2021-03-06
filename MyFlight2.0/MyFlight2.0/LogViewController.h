//
//  LogViewController.h
//  MyFlight2.0
//
//  Created by sss on 12-12-7.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceDelegate.h"
#import "AppConfigure.h"
#import "SinaWeibo.h"
#import "AppDelegate.h"
#import "SinaWeibo.h"
#import "TencentOAuth.h"
#import "TCWBEngine.h"



//登陆界面  
@interface LogViewController : UIViewController<ServiceDelegate,SinaWeiboDelegate,TencentSessionDelegate,UITextFieldDelegate>
{
    IBOutlet UITextField *logPassword;   // 登陆密码
    IBOutlet UITextField *logNumber;     // 登陆账号
    
    IBOutlet UIScrollView *ScrollerView;
    
    //新浪微博定义
//    SinaWeibo *sinaweibo;
    
    //腾讯QQ微博登陆定义
    TencentOAuth* _tencentOAuth;
    NSMutableArray* _permissions;
    
    //腾讯微博登陆定义
    TCWBEngine                  *weiboEngine;
}




@property (retain, nonatomic) IBOutlet UIView *thisViewLogin;



@property (nonatomic, retain) TCWBEngine   *weiboEngine;
//@property (readonly, nonatomic) SinaWeibo *sinaweibo;
//属性 传值 记录 登录的类型
@property(nonatomic,retain)NSString  *loginSuccessReturnType;









- (IBAction)beginLoging:(id)sender;      // 登陆



- (IBAction)registerNewNumber:(id)sender;// 注册

- (IBAction)backKeyBoard:(id)sender; //回收键盘 

//记住密码按钮
- (IBAction)rememberPassword:(id)sender;

@property (retain, nonatomic) IBOutlet UIButton *remembePasswordBn;


//找回密码 
- (IBAction)LookForPassword:(id)sender;

//用QQ账户登陆
- (IBAction)LoginWithQQ:(id)sender;

//用腾讯微博登陆
- (IBAction)LoginWithTencentWeiBo:(id)sender;

//用微信登陆
- (IBAction)LoginWithWeiXin:(id)sender;

//用新浪微博登陆
- (IBAction)LoginWithSinaWeiBo:(id)sender;


- (IBAction)backKey:(id)sender;

@property (retain, nonatomic) IBOutlet UISwipeGestureRecognizer *swipGesture;



@end
