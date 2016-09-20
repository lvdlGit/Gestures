//
//  BaseViewController.h
//  AutoFinance
//
//  Created by lvdl on 15/7/13.
//  Copyright (c) 2015年 www.palcw.com. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RDVTabBarController.h"
#import "NavGationView.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) NavGationView *navBar;

@property (nonatomic, strong) NavGationView *navLineBar;

@property (nonatomic, strong) NavGationView *navWhiteBar;

@property (nonatomic, strong) NavGationView *navRedBar;

@end
