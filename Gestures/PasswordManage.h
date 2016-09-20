//
//  PasswordManage.h
//  GesturesDemo
//
//  Created by lvdl on 16/08/8.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordManage : NSObject

/**
 *  保存密码
 *
 *  @param password NNSring
 */
+(void)setPassword:(NSString *)password;
+(NSString *)password;
+(void)deletePassword;

+(void)setNewPassword:(NSString *)newPassword;
+(NSString *)newPassword;
+(void)deleteNewPassword;
/**
 *  需不需要设置密码
 *
 *  @return BOOL
 */
+(BOOL)isOnWithNeedPassword;
+(void)needPasswordIsOn:(BOOL)isOn;

/**
 *  是否显示轨迹
 *
 *  @return BOOL
 */
+(BOOL)isOnWithShowTrack;
+(void)showTrackIsOn:(BOOL)isOn;


@end
