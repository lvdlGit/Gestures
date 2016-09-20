//
//  PasswordManage.m
//  GesturesDemo
//
//  Created by lvdl on 16/08/8.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "PasswordManage.h"

#define kPassword @"kPassword"
#define kNewPassword @"kNewPassword"
#define kNeedPassword @"kNeedPassword"
#define kShowTrack  @"kShowTrack"

@implementation PasswordManage

+(void)setPassword:(NSString *)password
{
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:kPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)password
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:kPassword];
}

+(void)deletePassword
{
    
    [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:kPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)setNewPassword:(NSString *)newPassword
{
    [[NSUserDefaults standardUserDefaults] setObject:newPassword forKey:kNewPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)newPassword
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:kNewPassword];
}

+(void)deleteNewPassword
{
    
    [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:kNewPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)needPasswordIsOn:(BOOL)isOn
{
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:kNeedPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

+(BOOL)isOnWithNeedPassword
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kNeedPassword];
}

+(void)showTrackIsOn:(BOOL)isOn
{
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:kShowTrack];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

+(BOOL)isOnWithShowTrack
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kShowTrack];

}

@end
