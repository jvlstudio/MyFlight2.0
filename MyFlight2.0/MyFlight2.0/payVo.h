//
//  payVo.h
//  MyFlight2.0
//
//  Created by Davidsph on 12/28/12.
//  Copyright (c) 2012 LIAN YOU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface payVo : NSObject
 
 

@property(nonatomic,retain)NSString *payPassword; //支付密码
@property(nonatomic,retain)NSString *captcha; //优惠券id


@property(nonatomic,retain)NSString *isNeedPayPwd; //是否需要密码

@property(nonatomic,retain)NSString *isNeedAccount; //是否使用资金账户 金币支付
@property(nonatomic,retain)NSString *needNotSilver;  // 不需要使用银币




@end
