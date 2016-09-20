//
//  GestureViewController.h
//  GesturesDemo
//
//  Created by lvdl on 16/08/7.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureView.h"
#import "BaseViewController.h"

// 手势密码 页面 弹出类型
typedef NS_OPTIONS(NSUInteger, GestureViewControllerAppearType) {
    PopAppearType            = 0 ,         //  pop
    ModalAppearType          = 1 << 0 ,    //  模态
};


@interface GestureViewController : BaseViewController


@property (nonatomic, assign) GestureViewControllerAppearType appearType;

/**
 *  情况：
 */
@property(nonatomic,assign)BOOL isGoLogin;

@property(nonatomic,assign)BOOL isModify;

@property (nonatomic, weak) UINavigationController *naVCtr;

-(instancetype)initWithCaseMode:(CaseMode)caseMode;

@end
