//
//  NavGationView.h
//  AutoFinance
//
//  Created by lvdl on 15/7/13.
//  Copyright (c) 2015年 www.palcw.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavGationView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *titleView;

@property (nonatomic, strong) UIButton *leftButtonItem1;
@property (nonatomic, strong) UIButton *leftButtonItem2;

@property (nonatomic, strong) UIButton *rightButtonItem1;
@property (nonatomic, strong) UIButton *rightButtonItem2;

@property (nonatomic, strong) UIView *rightButtonItems;

@property (nonatomic, strong) UIImageView *barImgView;

@end
