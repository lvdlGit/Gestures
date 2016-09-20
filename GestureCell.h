//
//  GestureCell.h
//  GesturesDemo
//
//  Created by lvdl on 16/9/20.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureCell : UITableViewCell

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *content;

@property (nonatomic, strong) UIImageView *arrow;

@property (nonatomic, strong) UISwitch *switchView;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *middleLine;
@property (nonatomic, strong) UIView *bottomLine;

@end
