//
//  GestureViewController.m
//  GesturesDemo
//
//  Created by lvdl on 16/08/7.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "GestureViewController.h"
#import "PasswordButton.h"
#import "PasswordManage.h"
#import "CachesData.h"
//#import "RequestData.h"
//#import "LoginViewController.h"

static NSInteger const errorGestureSum = 5;
static NSInteger const kAlertViewTag = 16033018;

@interface GestureViewController ()<caseDelegate>

@property (nonatomic, assign) CaseMode style;

@property (nonatomic, strong) UIView *backGroundView;  // 视图 容器

@property (nonatomic, strong) NSMutableArray *buttonArray;

@property (nonatomic, strong) UIView *buttonsView;  // 九宫格 按钮区

@property (nonatomic, strong) GestureView *tentacleView;  //  手势 痕迹 层

@property (nonatomic, strong) UILabel *tipLbel;

@property (nonatomic, strong) UILabel *userLabel;

@property (nonatomic, strong) UIButton *forgetButton;  // 忘记密码

@property (nonatomic, strong) UIButton *cancleModify;   // 取消 修改

@property (nonatomic, strong) UIButton *cancleSetGesture;  // 取消设置

@property (nonatomic, strong) UIButton *againSetGesture;  //  重新设置

@property (nonatomic, assign) NSInteger errorGestureNum;

@end

@implementation GestureViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    if (!kIsLogin) {
//        
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
//    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isSettingNotice" object:nil];

}

-(instancetype)initWithCaseMode:(CaseMode)caseMode
{
    if (self = [super init]) {
        _style = caseMode;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _errorGestureNum = 0;
    
    [self makeTop];
    
    [self makeUI];
}

-(void)makeTop
{
    if (!_userLabel) {
        
        CGRect userFrame ;
        if (iPhone4 ) {
            userFrame = CGRectMake(0, 70, SCREEN_WIDTH_IPHONE, 16);
        }
        else if (iPhone5) {
            userFrame = CGRectMake(0, 90, SCREEN_WIDTH_IPHONE, 16);
        }
        else if (iPhone6) {
            userFrame = CGRectMake(0, 98, SCREEN_WIDTH_IPHONE, 16);
        }
        else if (iPhone6P) {
            userFrame = CGRectMake(0, 109, SCREEN_WIDTH_IPHONE, 16);
        }
        
        _userLabel = [[UILabel alloc] initWithFrame:userFrame];
//        [_backGroundView addSubview:_userLabel];
        [self.view addSubview:_userLabel];
        
        _userLabel.font = kFont(16);
        _userLabel.textColor = RGBA(51, 51, 51, 1);
        _userLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    if (!_tipLbel) {
        
        CGRect tipFrame ;
        if (iPhone4) {
            tipFrame = CGRectMake(0, _userLabel.bottom + 23, SCREEN_WIDTH_IPHONE, 14);
        }
        else if (iPhone5) {
            tipFrame = CGRectMake(0, _userLabel.bottom + 38, SCREEN_WIDTH_IPHONE, 14);
        }
        else if (iPhone6) {
            tipFrame = CGRectMake(0, _userLabel.bottom + 40, SCREEN_WIDTH_IPHONE, 14);
        }
        else if (iPhone6P) {
            tipFrame = CGRectMake(0, _userLabel.bottom + 47, SCREEN_WIDTH_IPHONE, 14);
        }
        
        _tipLbel = [[UILabel alloc] initWithFrame:tipFrame];
//        [_backGroundView addSubview:_tipLbel];
        [self.view addSubview:_tipLbel];
        
        _tipLbel.textColor =  kRedColor;
        _tipLbel.font = kFont(14);
        _tipLbel.textAlignment = NSTextAlignmentCenter;
    }
    
    switch (_style) {
        case VerifyMode: {
            if (_isGoLogin == YES) {
                self.title = @"请输入原密码";
                _userLabel.text = [NSString stringWithFormat:@"欢迎您, %@", [CachesData readUserName]];
            }
            else if (_isModify == YES) {
                self.title = @"手势密码";
                _userLabel.text = @"请输入原手势密码";
            }
            else{
                self.title = @"手势密码";
                _userLabel.text = @"再次绘制解锁图案";
            }
            break;
        }
        case ResetMode: {
            
            self.title = @"手势密码";
            _userLabel.text = @"绘制解锁图案";

            break;
        }
        default: {
            break;
        }
    }
    
    if (_isGoLogin == YES) {
        _tipLbel.hidden = YES;
    }
}

-(void)makeUI
{
    CGFloat width ;
    CGFloat offSetY;
    if (iPhone4) {
        width = 296;
        offSetY = 25;
    }
    else if (iPhone5) {
        width = 296;
        offSetY = 38;
    }
    else if (iPhone6) {
        width = 330;
        offSetY = 53;
    }
    else if (iPhone6P) {
        width = 370;
        offSetY = 57;
    }
    
    CGRect tentacleFrame = CGRectMake((SCREEN_WIDTH_IPHONE - width) * 0.5, _tipLbel.bottom + offSetY, width, width);
    
    if (_buttonsView) {
        [_buttonsView removeFromSuperview];
        _buttonsView = nil;
    }
    _buttonsView = [[UIView alloc]initWithFrame:tentacleFrame];
//    [_backGroundView addSubview:_buttonsView];
    [self.view addSubview:_buttonsView];

    _buttonArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < 9; i++) {
        NSInteger row = i / 3;
        NSInteger col = i % 3;
        // Button Frame
        NSInteger distance = width / 3;
        NSInteger size = distance / 1.5;
        NSInteger margin = size / 4;
        CGRect btnFrame = CGRectMake(col * distance + margin, row * distance, size, size);
        
        PasswordButton *gesturePasswordButton = [[PasswordButton alloc]initWithFrame:btnFrame];
        [gesturePasswordButton setTag:i];
        [_buttonsView addSubview:gesturePasswordButton];
        [_buttonArray addObject:gesturePasswordButton];
    }
    
    if (_tentacleView) {
        
        [_tentacleView removeFromSuperview];
        _tentacleView = nil;
    }
    
    _tentacleView = [[GestureView alloc] initWithFrame:tentacleFrame];
    _tentacleView.style = _style;
    [_tentacleView setButtonArray:_buttonArray];
    _tentacleView.caseDelegate = self;
//    [_backGroundView addSubview:_tentacleView];
    [self.view addSubview:_tentacleView];
    
    if (_style == VerifyMode) {
        if ([PasswordManage isOnWithNeedPassword]) {  //
            
            if (_isGoLogin) { // 登录
                if (!kIsLogin) {
                    [self forgetPassword];
                }
            }
            else {  // 修改 时 先验证
                
                if (_isModify) {  // 修改手势密码 时, 先验证 旧手势密码
                    
                    [self cancleModifyButton];
                }
                else {   // 修改手势密码 , 设置 密码 后 验证 手势密码
                    
                    if (_cancleModify) {
                        [_cancleModify removeFromSuperview];
                        _cancleModify = nil;
                    }
                    
                    [self againSetGestureButton];
                    
                    [self cancleSetGestureButton];
                }
            }
        }
        else {  // 设置后 验证
            [self againSetGestureButton];
            
            [self cancleSetGestureButton];
        }
    }
    else if (_style == ResetMode){
        if (_isModify) {  // 修改手势密码 时, 设置 手势密码
            
            [self cancleModifyButton];
        }
        else {
            
            if (_againSetGesture) {
                [_againSetGesture removeFromSuperview];
                _againSetGesture = nil;
            }
            
            [self cancleSetGestureButton];
        }
    }
}

- (void)forgetPassword
{
    CGFloat offSetY;
    if (iPhone4) {
        offSetY = -24;
    }
    else if (iPhone5) {
        offSetY = - 8;
    }
    else if (iPhone6) {
        offSetY = 18;
    }
    else if (iPhone6P) {
        offSetY = 18;
    }
    
    _forgetButton = [[UIButton alloc] initWithFrame:CGRectMake(0, _tentacleView.bottom + offSetY, 95, 44)];  // 15
//    [_backGroundView addSubview:_forgetButton];
    [self.view addSubview:_forgetButton];
    _forgetButton.right = SCREEN_WIDTH_IPHONE - _tentacleView.left * 2.5;
    
//    _forgetButton.backgroundColor = [UIColor redColor];
    
    _forgetButton.titleLabel.font = kFont(14);
    
    [_forgetButton setTitle:@"忘记手势密码?" forState:UIControlStateNormal];
    [_forgetButton setTitle:@"忘记手势密码?" forState:UIControlStateHighlighted];
    [_forgetButton setTitle:@"忘记手势密码?" forState:UIControlStateSelected];
    
    [_forgetButton setTitleColor:kGreenColor forState:UIControlStateNormal];
    [_forgetButton setTitleColor:kGreenColor forState:UIControlStateHighlighted];
    [_forgetButton setTitleColor:kGreenColor forState:UIControlStateSelected];
    
    [_forgetButton addTarget:self action:@selector(forgetGesture:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)forgetGesture:(UIButton *)btn
{
    // 弹窗
    NSString *message = @"忘记手势密码, 您需要重新登录";
    if (iOS8) {
        
        __block GestureViewController *this = self;
        
        UIAlertController *actionAlertController = [UIAlertController alertControllerWithTitle:nil
                                                                                       message:message
                                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {}];
        [actionAlertController addAction:actionCancel];

        UIAlertAction *actionOther = [UIAlertAction actionWithTitle:@"重新登录"
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action) {
                                                                
                                                                NSLog(@"我要 重新登录 !");
                                                                [this goLogin];
                                                            }];
        [actionAlertController addAction:actionOther];
        
        [self presentViewController:actionAlertController animated:YES completion:nil];
    }
    else {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重新登录", nil];
        alertView.tag = kAlertViewTag;
        [alertView show];
    }
}

- (void)againSetGestureButton
{
    if (!_againSetGesture) {
        
        CGFloat offSetY;
        if (iPhone4) {
            offSetY = -24;
        }
        else if (iPhone5) {
            offSetY = - 8;
        }
        else if (iPhone6) {
            offSetY = 18;
        }
        else if (iPhone6P) {
            offSetY = 18;
        }
        
        _againSetGesture = [[UIButton alloc] initWithFrame:CGRectMake(_tentacleView.left * 2.5, _tentacleView.bottom + offSetY, 63, 44)];  // 15
//        [_backGroundView addSubview:_againSetGesture];
        [self.view addSubview:_againSetGesture];
        
        _againSetGesture.titleLabel.font = kFont(14);
        
        [_againSetGesture setTitle:@"重新设置" forState:UIControlStateNormal];
        [_againSetGesture setTitle:@"重新设置" forState:UIControlStateHighlighted];
        [_againSetGesture setTitle:@"重新设置" forState:UIControlStateSelected];
        
        [_againSetGesture setTitleColor:kGreenColor forState:UIControlStateNormal];
        [_againSetGesture setTitleColor:kGreenColor forState:UIControlStateHighlighted];
        [_againSetGesture setTitleColor:kGreenColor forState:UIControlStateSelected];
        
        [_againSetGesture addTarget:self action:@selector(againSetGestureAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)cancleSetGestureButton
{
    if (!_cancleSetGesture) {
        
        CGFloat offSetY;
        if (iPhone4) {
            offSetY = -24;
        }
        else if (iPhone5) {
            offSetY = - 8;
        }
        else if (iPhone6) {
            offSetY = 18;
        }
        else if (iPhone6P) {
            offSetY = 18;
        }
        
        _cancleSetGesture = [[UIButton alloc] initWithFrame:CGRectMake(0, _tentacleView.bottom + offSetY, 63, 44)];  // 15
//        [_backGroundView addSubview:_cancleSetGesture];
        [self.view addSubview:_cancleSetGesture];
        _cancleSetGesture.right = SCREEN_WIDTH_IPHONE - _tentacleView.left * 2.5;
        
        _cancleSetGesture.titleLabel.font = kFont(14);
        
        [_cancleSetGesture setTitle:@"取消设置" forState:UIControlStateNormal];
        [_cancleSetGesture setTitle:@"取消设置" forState:UIControlStateHighlighted];
        [_cancleSetGesture setTitle:@"取消设置" forState:UIControlStateSelected];
        
        [_cancleSetGesture setTitleColor:kGreenColor forState:UIControlStateNormal];
        [_cancleSetGesture setTitleColor:kGreenColor forState:UIControlStateHighlighted];
        [_cancleSetGesture setTitleColor:kGreenColor forState:UIControlStateSelected];
        
        [_cancleSetGesture addTarget:self action:@selector(cancleSetGestureAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)cancleModifyButton
{
    if (!_cancleModify) {
        
        CGFloat offSetY;
        if (iPhone4) {
            offSetY = -24;
        }
        else if (iPhone5) {
            offSetY = - 8;
        }
        else if (iPhone6) {
            offSetY = 18;
        }
        else if (iPhone6P) {
            offSetY = 18;
        }
        
        _cancleModify = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH_IPHONE - 120) * 0.5, _tentacleView.bottom + offSetY, 120, 44)];  // 15
        [self.view addSubview:_cancleModify];
        _cancleModify.titleLabel.font = kFont(14);
        
        [_cancleModify setTitle:@"取消修改" forState:UIControlStateNormal];
        [_cancleModify setTitle:@"取消修改" forState:UIControlStateHighlighted];
        [_cancleModify setTitle:@"取消修改" forState:UIControlStateSelected];
        
        [_cancleModify setTitleColor:kGreenColor forState:UIControlStateNormal];
        [_cancleModify setTitleColor:kGreenColor forState:UIControlStateHighlighted];
        [_cancleModify setTitleColor:kGreenColor forState:UIControlStateSelected];
        
        [_cancleModify addTarget:self action:@selector(cancleModifyAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)againSetGestureAction:(UIButton *)button
{
    [PasswordManage deleteNewPassword];
    
    self.style = ResetMode;
    self.isGoLogin = NO;
    
    [self makeTop];
    [self makeUI];
    
    [self cleanTipLabel];
}

- (void)cancleSetGestureAction:(UIButton *)button
{
    [PasswordManage deleteNewPassword];
    
    [self pop];
}

- (void)cancleModifyAction:(UIButton *)button
{
    [self pop];
}

#pragma mark -  UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        //  我要 重新登录
        [self goLogin];
    }
}

- (void)goLogin
{
    [PasswordManage deletePassword];
    
    [PasswordManage needPasswordIsOn:NO];
    
    [self pop];
}


#pragma mark - setTouchBeginDelegate
-(BOOL)verification:(NSString *)result
{
    NSString *password;
    
    if ([PasswordManage isOnWithNeedPassword] == NO) {
        password = [PasswordManage newPassword];
    }
    else {
        if (_isGoLogin) {
            password = [PasswordManage password];
        }
        else {
            if (_isModify) {
                password = [PasswordManage password];
            }
            else {
               password = [PasswordManage newPassword];
            }
        }
    }
    
    if ([result isEqualToString:password] == YES) {
        
        if ([PasswordManage isOnWithNeedPassword] == YES) {
            
            if (_isGoLogin == YES) {  // 手势密码登录
                
                // 登录
                [CachesData shareCachesData].isLogin = YES;
                [self pop];
                
                [self succesLable];
            }
            else {
                [PasswordManage needPasswordIsOn:YES];
                if (_isModify) {
                    // 修改手势密码 时, 先验证 旧手势密码
                    
                    self.style = ResetMode;
                    self.isGoLogin = NO;

                    [self makeTop];
                    [self makeUI];
                }
                else {
                     // 修改手势密码 后 验证 手势密码
                    [PasswordManage setPassword:[PasswordManage newPassword]];  // 记录修改 后 的 密码
                    [PasswordManage deleteNewPassword];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"isSettingNotice" object:nil];
                    [self pop];
                }
            }
        }
        else {
            // 设置手势密码 后 验证密码
            [PasswordManage needPasswordIsOn:YES];
            [PasswordManage setPassword:[PasswordManage newPassword]]; // 记录设置 后 的 密码
            [PasswordManage deleteNewPassword];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"isSettingNotice" object:nil];
            [self pop];
        }

        return YES;
    }
    else {
        [self errorLable];
        return NO;
    }
}

-(BOOL)resetPassword:(NSString *)result
{
    if ([result length] < 4) {  // 至少连接 4 个点
       
        _tipLbel.text = @"至少连接4个点, 请重新输入";
        _tipLbel.textColor = [UIColor redColor];
        return NO;
    }
    
    [PasswordManage setNewPassword:result];
    
    self.style = VerifyMode;
    self.isGoLogin = NO;
    self.isModify = NO;
    
    [self makeTop];
    [self makeUI];
    
    return YES;
}

-(void)succesLable
{
    _tipLbel.text = @"验证成功";
    _tipLbel.textColor = [UIColor blackColor];
}

-(void)errorLable
{
    if (_isGoLogin == YES) {  // 手势密码 登录 时
        _errorGestureNum ++;
        
        // 手势密码 多次 输入 错误,  强制账号密码登录 重新设置手势密码
        if (_errorGestureNum >= errorGestureSum) {
            // 弹窗 提示 重新登录 (关闭手势密码)
            NSLog(@"强制账号密码登录 😢重新设置手势密码");
//            [NSString stringWithFormat:@"%d错误,请重新登录", errorGestureSum];
            _errorGestureNum = 0;
            
            [self forgetGesture:_forgetButton];
        }
        
        _tipLbel.hidden = NO;
        _tipLbel.text = [[NSString alloc] initWithFormat:@"手势密码不正确,剩余尝试次数%ld次",(long)(errorGestureSum - _errorGestureNum)];
    }
    else {  // 设置 手势密码时, 验证手势 密码
        
        _tipLbel.text = @"与上次绘制手势密码不一致";
        
    }
    _tipLbel.textColor = [UIColor redColor];
    
    // 抖动
    [self shakeView:_tipLbel];
    
    [self performSelector:@selector(cleanTipLabel) withObject:self afterDelay:1.0f];
}

#pragma mark - 抖动效果
-(void)shakeView:(UIView*)viewToShake
{
    CGFloat t =2.0;
    CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
    CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    
    viewToShake.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        viewToShake.transform = translateRight;
    } completion:^(BOOL finished){
        if(finished){
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                viewToShake.transform =CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

- (void)cleanTipLabel
{
    _tipLbel.text = @"";
}

#pragma mark - btn click
- (void)backAction:(UIButton *)sender
{
    [PasswordManage deleteNewPassword];
    
    // 返回上一个页面
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)pop
{
    if (_appearType == PopAppearType) { // 登陆后 , 设置 或修改 返回 个人中心
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (_appearType == ModalAppearType) {  // 注册 时, 设置  模态
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
