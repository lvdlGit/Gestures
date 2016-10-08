//
//  ViewController.m
//  GesturesDemo
//
//  Created by lvdl on 16/1/12.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "ViewController.h"
#import "GestureViewController.h"
#import "PasswordManage.h"
#import "GestureCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *backGroundView;

@property (nonatomic, strong) UITableView *memberInfo;    // 用户信息 列表

@property (nonatomic, strong) NSArray *infoList;  //  member 数据

@property (nonatomic, strong) NSArray *infoTitle;  // 信息 标题

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([PasswordManage isOnWithNeedPassword]) {  // 有 手势密码
        
        _infoTitle = @[@"手势密码",@"显示轨迹",@"修改手势密码"];
    }
    else {
        _infoTitle = @[@"手势密码"];
    }
    
    [_memberInfo reloadData];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 手势
    if ([PasswordManage isOnWithNeedPassword]) {
//        [PasswordManage showTrackIsOn:YES];  // 显示 轨迹
        [PasswordManage needPasswordIsOn:YES];
        GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:VerifyMode];
        ges.appearType = ModalAppearType;
        ges.isGoLogin = YES;
        ges.isModify = NO;
        ges.naVCtr = self.navigationController;
        [[[UIApplication sharedApplication].delegate window].rootViewController presentViewController:ges animated:YES completion:nil];
    }
    
    [self initNavGationItem];
    
    [self initBackGroundView];
    
    [self initMemberInfo];
    
    DLog(@"手势密码");
}

- (void)initNavGationItem
{
    [self navWhiteBar];
    
    self.navWhiteBar.title = @"手势密码";
}

#pragma mark - 背景设置
- (void)initBackGroundView
{
    CGFloat bgHeight = SCREEN_HEIGHT_IPHONE - 64;
    
    _backGroundView = [[UIView alloc] init];
    [self.view addSubview:_backGroundView];
    
    _backGroundView.frame = CGRectMake(0, 64, SCREEN_WIDTH_IPHONE, bgHeight);
    _backGroundView.backgroundColor = kBackGroundColor;
}

- (void)initMemberInfo
{
    if ([PasswordManage isOnWithNeedPassword]) {  // 有 手势密码
        
        _infoTitle = @[@"手势密码",@"显示轨迹",@"修改手势密码"];
    }
    else {
        _infoTitle = @[@"手势密码"];
    }
    
    _memberInfo = [[UITableView alloc] initWithFrame:_backGroundView.bounds style:UITableViewStylePlain];
    [_backGroundView addSubview:_memberInfo];
    
    _memberInfo.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _memberInfo.delegate = self;
    _memberInfo.dataSource = self;
}

#pragma mask - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _infoTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    GestureCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        cell = [[GestureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSString *title = _infoTitle[indexPath.row];
    
    // title
    cell.title.text = title;
    
    // switch
    if (indexPath.row == 0) {
        cell.switchView.hidden = NO;
        
        if ([PasswordManage isOnWithNeedPassword]) {
            cell.switchView.on = YES;
        }
        else {
            cell.switchView.on = NO;
        }
        
        [cell.switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    else if (indexPath.row == 1){
        cell.switchView.hidden = NO;
        
        if ([PasswordManage isOnWithShowTrack]) {
            cell.switchView.on = YES;
        }
        else {
            cell.switchView.on = NO;
        }
        
        [cell.switchView addTarget:self action:@selector(trajectoryAction:) forControlEvents:UIControlEventValueChanged];
    }
    else {
       cell.switchView.hidden = YES;
    }
    
    // arrow
    if (indexPath.row == 2) {
        
        cell.arrow.hidden = NO;
    }
    else {
        cell.arrow.hidden = YES;
    }
    
    // line
    if (indexPath.row == 0 && indexPath.row != _infoTitle.count - 1) {
        cell.topLine.hidden = NO;
        cell.bottomLine.hidden = YES;
        cell.middleLine.hidden = NO;
    }
    else if (indexPath.row == 0 && indexPath.row == _infoTitle.count - 1 ) {
        
        cell.topLine.hidden = NO;
        cell.middleLine.hidden = YES;
        cell.bottomLine.hidden = NO;
    }
    else if (indexPath.row == _infoTitle.count - 1) {
        cell.topLine.hidden = YES;
        cell.middleLine.hidden = YES;
        cell.bottomLine.hidden = NO;
    }
    else {
        cell.topLine.hidden = YES;
        cell.middleLine.hidden = NO;
        cell.bottomLine.hidden = YES;
    }

    return cell;
}

#pragma mask - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 2) {
        GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:VerifyMode];
        ges.isGoLogin = NO;
        ges.isModify = YES;
        ges.appearType = ModalAppearType;
        [self presentViewController:ges animated:YES completion:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)switchAction:(UISwitch *)switchView
{
    if (switchView.on) {
        
        // 去设置 密码 (设置成功后 才能 改变手势密码记录信息)
        [PasswordManage showTrackIsOn:YES];  // 显示 轨迹
        GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:ResetMode];
        ges.isGoLogin = NO;
        ges.appearType = ModalAppearType;
        [self presentViewController:ges animated:YES completion:nil];
    }
    else {
        // 关闭 手势 密码
        [PasswordManage needPasswordIsOn:NO];
        [PasswordManage deletePassword];
        
        _infoTitle = @[@"手势密码"];
        
        [_memberInfo reloadData];
    }
}

- (void)trajectoryAction:(UISwitch *)trajectory
{
    if (trajectory.on) {
        
        [PasswordManage showTrackIsOn:NO];  // 显示 轨迹
    }
    else {
        [PasswordManage showTrackIsOn:YES];  // 显示 轨迹
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
