//
//  BaseViewController.m
//  AutoFinance
//
//  Created by lvdl on 15/7/13.
//  Copyright (c) 2015年 www.palcw.com. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NavGationView *)navWhiteBar
{
    if (_navWhiteBar == nil) {
        _navWhiteBar = [[NavGationView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_IPHONE, 64)];
        [self.view addSubview:_navWhiteBar];
        _navWhiteBar.backgroundColor = RGBA(255, 255, 255, 1);
        _navWhiteBar.titleLabel.textColor = kRedColor;
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, SCREEN_WIDTH_IPHONE, 0.5)];
        [_navWhiteBar addSubview:line];
        line.backgroundColor = kLineColor;
    }
    return _navWhiteBar;
}

- (NavGationView *)navRedBar
{
    if (_navRedBar == nil) {
        _navRedBar = [[NavGationView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_IPHONE, 64)];
        [self.view addSubview:_navRedBar];
        
        _navRedBar.backgroundColor = kRedColor;
    }
    return _navRedBar;
}

- (NavGationView *)navLineBar
{
    if (_navLineBar == nil) {
        _navLineBar = [[NavGationView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_IPHONE, 64)];
        [self.view addSubview:_navLineBar];
        _navLineBar.backgroundColor = RGBA(83, 171, 245, 1);
        
//        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 63, SCREEN_WIDTH_IPHONE, 1)];
//        [_navLineBar addSubview:line];
//        line.backgroundColor = RGBA(166, 166, 166, .5);
    }
    return _navLineBar;
}

- (NavGationView *)navBar
{
    if (_navBar == nil) {
        _navBar = [[NavGationView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_IPHONE, 64)];
        [self.view addSubview:_navBar];
        
        _navBar.backgroundColor = [UIColor clearColor];
    }
    return _navBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
