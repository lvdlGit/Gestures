//
//  CachesData.h
//  AutoFinance
//
//  Created by lvdl on 15/7/13.
//  Copyright (c) 2015年 www.palcw.com. All rights reserved.
//

#import <Foundation/Foundation.h>


#define   kIsLogin           [[CachesData shareCachesData] isLogin]

//  缓存数据
#define   kUserName          @"kUserName"
#define   kNewUserName       @"kNewUserName"

@interface CachesData : NSObject

@property (nonatomic, assign) BOOL isLogin;


+ (CachesData *)shareCachesData;

+ (void)saveUserValue:(id)value forKey:(NSString *)key;

+ (id)readUserValueForKey:(NSString *)key;


/**
 *  保存、读取 用户名 (登陆名)
 */
+ (void)saveUserName:(NSString *)name;
+ (NSString *)readUserName;

+ (void)saveNewUserName:(NSString *)name;
+ (NSString *)readNewUserName;
+ (void)removeNewUserName;

@end
