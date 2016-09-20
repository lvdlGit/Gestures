//
//  CachesData.m
//  AutoFinance
//
//  Created by lvdl on 15/7/13.
//  Copyright (c) 2015年 www.palcw.com. All rights reserved.
//

#import "CachesData.h"

static CachesData *shareCaches = nil;
@implementation CachesData

+ (CachesData *)shareCachesData
{
    if (!shareCaches) {
        shareCaches = [[CachesData alloc] init];
    }

    return shareCaches;
}

- (void)initSystemResources
{
    _isLogin = NO;
    
}

+ (void)saveUserValue:(id)value forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
//    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)readUserValueForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

+ (void)saveUserName:(NSString *)name
{
    if (!name || [name length] == 0) {
        return;
    }
    [self saveUserValue:name forKey:kUserName];
}

+ (NSString *)readUserName
{
    NSString *name = [self readUserValueForKey:kUserName];
    return name;
}

+ (void)saveNewUserName:(NSString *)name
{
    if (!name || [name length] == 0) {
        return;
    }
    [self saveUserValue:name forKey:kNewUserName];
}

+ (NSString *)readNewUserName
{
    NSString *name = [self readUserValueForKey:kNewUserName];
    return name;
}

+ (void)removeNewUserName
{
    [self saveUserValue:@"" forKey:kNewUserName];
}


@end
