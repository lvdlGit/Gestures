//
//  GestureView.h
//  GesturesDemo
//
//  Created by lvdl on 16/08/6.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, CaseMode) {
    VerifyMode = 0,/*校验密码*/
    ResetMode,     /*重置密码*/
};
@protocol caseDelegate <NSObject>
/**
 *  重置密码
 *
 *  @param result YES或NO
 *
 *  @return BOOL
 */
- (BOOL)resetPassword:(NSString *)result;
/**
 *  校验密码
 *
 *  @param result YES或NO
 *
 *  @return BOOL
 */
- (BOOL)verification:(NSString *)result;


@end

@interface GestureView : UIView

@property (nonatomic,strong) NSArray *buttonArray;

/**
 *  各种情况
 */
@property(assign,nonatomic)CaseMode style;

@property (nonatomic,assign) id<caseDelegate> caseDelegate;


- (void)enterArgin;


@end
