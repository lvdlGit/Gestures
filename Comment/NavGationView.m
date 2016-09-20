//
//  NavGationView.m
//  AutoFinance
//
//  Created by lvdl on 15/7/13.
//  Copyright (c) 2015年 www.palcw.com. All rights reserved.
//

#import "NavGationView.h"

//static CGFloat const kBarHeight = 64;

@implementation NavGationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat kBarHeight;
        if (iOS7) {
            
             kBarHeight = 64;
        } else {
            
            kBarHeight = 44;
        }
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH_IPHONE, kBarHeight);
        self.backgroundColor = RGBA(241, 241, 241, 1);
    }
    return self;
}

- (void)setBarImgView:(UIImageView *)barImgView
{
    if (_barImgView) {
        [_barImgView removeFromSuperview];
        _barImgView = nil;
    }
    
    _barImgView = barImgView;
    [self addSubview:_barImgView];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    if (_titleLabel) {
        _titleLabel.text = _title;
    }else{
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 44, SCREEN_WIDTH_IPHONE - 90, 44)];
        [self setTitleLabel:label];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = kFont(18);
        
        CGPoint center = label.center;
        center.x = SCREEN_WIDTH_IPHONE * 0.5;
        label.center = center;
        
//        label.center = CGPointMake(SCREEN_WIDTH_IPHONE * 0.5, 49);
    }
}

- (void)setTitleLabel:(UILabel *)titleLabel
{
    _titleLabel = titleLabel;
    if (_title) {
        _titleLabel.text = _title;
    }
    [self addSubview:_titleLabel];
}

- (void)setTitleView:(UIView *)titleView
{
    if (_titleView) {
        [_titleView removeFromSuperview];
        _titleView = nil;
    }
    _titleView = titleView;
    [self addSubview:_titleView];
}

- (void)setLeftButtonItem1:(UIButton *)leftButtonItem
{
    if (_leftButtonItem1) {
        [_leftButtonItem1 removeFromSuperview];
        _leftButtonItem1 = nil;
    }
    _leftButtonItem1 = leftButtonItem;
    [self addSubview:_leftButtonItem1];
}

- (void)setLeftButtonItem2:(UIButton *)leftButtonItem
{
    if (_leftButtonItem2) {
        [_leftButtonItem2 removeFromSuperview];
        _leftButtonItem2 = nil;
    }
    _leftButtonItem2 = leftButtonItem;
    [self addSubview:_leftButtonItem2];
}

- (void)setRightButtonItem1:(UIButton *)rightButtonItem
{
    if (_rightButtonItem1) {
        [_rightButtonItem1 removeFromSuperview];
        _rightButtonItem1 = nil;
    }
    _rightButtonItem1 = rightButtonItem;
    [self addSubview:_rightButtonItem1];
}

- (void)setRightButtonItem2:(UIButton *)rightButtonItem
{
    if (_rightButtonItem2) {
        [_rightButtonItem2 removeFromSuperview];
        _rightButtonItem2 = nil;
    }
    _rightButtonItem2 = rightButtonItem;
    [self addSubview:_rightButtonItem2];
}

- (void)setRightButtonItems:(UIView *)rightButtonItems
{
    if (_rightButtonItems) {
        [_rightButtonItems removeFromSuperview];
        _rightButtonItems = nil;
    }
    _rightButtonItems = rightButtonItems;
    [self addSubview:_rightButtonItems];
}


@end
