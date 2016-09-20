//
//  PasswordButton.m
//  GesturesDemo
//
//  Created by lvdl on 16/08/6.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "PasswordButton.h"
#import "PasswordManage.h"

@implementation PasswordButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = self.bounds;
    
    // button 选中状态
    if (_selected) {
        //在画的时候
        if (_success) {//验证成功的
            if (![PasswordManage isOnWithShowTrack]) { // 不显示 轨迹
                
                CGContextSetRGBStrokeColor(context, 255/255.f, 100/255.f, 100/255.f,0); //线条颜色 (蓝色) 透明
                CGContextSetRGBFillColor(context,255/255.f, 100/255.f, 100/255.f,0);    // 中心远点颜色  透明
            }
            else {
                CGContextSetRGBStrokeColor(context, 255/255.f, 100/255.f, 100/255.f,1); //线条颜色 (蓝色)
                CGContextSetRGBFillColor(context, 255/255.f, 100/255.f, 100/255.f,1);    // 中心远点颜色
            }
        }
        else {//验证失败
            if (![PasswordManage isOnWithShowTrack]) { // 不显示 轨迹
                
                CGContextSetRGBStrokeColor(context, 208/255.f, 36/255.f, 36/255.f,0);// 默认 线条颜色
                CGContextSetRGBFillColor(context,208/255.f, 36/255.f, 36/255.f,0);   // 中心远点颜色  透明
            }
            else {
                
                CGContextSetRGBStrokeColor(context, 208/255.f, 36/255.f, 36/255.f,1);//线条颜色 (红色)
                CGContextSetRGBFillColor(context,208/255.f, 36/255.f, 36/255.f,1);   // 中心远点颜色
            }
        }
        CGRect frame = CGRectMake(bounds.size.width/2-bounds.size.width/8+1, bounds.size.height/2-bounds.size.height/8, bounds.size.width/4, bounds.size.height/4);
        
        CGContextAddEllipseInRect(context,frame);
        CGContextFillPath(context);
    }
    else{
        
        // button 默认状态
        CGContextSetRGBStrokeColor(context, 236/255.f, 231/255.f, 227/255.f,1); //线条颜色 灰色
    }
    
    CGContextSetLineWidth(context,2);
    CGRect frame = CGRectMake(2, 2, bounds.size.width-3, bounds.size.height-3);
    CGContextAddEllipseInRect(context,frame);
    CGContextStrokePath(context);
    if (_success) {
        if (![PasswordManage isOnWithShowTrack]) { // 不显示 轨迹
            CGContextSetRGBFillColor(context,255/255.f, 100/255.f, 100/255.f,0); //中心远点颜色 透明
        }
        else{
            
            CGContextSetRGBFillColor(context,255/255.f, 100/255.f, 100/255.f,0.2); //中心远点颜色 蓝色
        }
    }
    else {
        if (![PasswordManage isOnWithShowTrack]) { // 不显示 轨迹
            CGContextSetRGBFillColor(context,30/255.f, 175/255.f, 235/255.f,0); //中心远点颜色 透明
        }
        else{
            
            CGContextSetRGBFillColor(context,208/255.f, 36/255.f, 36/255.f,0.2); //中心远点颜色 红色
        }
    }
    CGContextAddEllipseInRect(context,frame);
    if (_selected) {
        CGContextFillPath(context);
    }
}

@end
