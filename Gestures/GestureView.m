//
//  GestureView.m
//  GesturesDemo
//
//  Created by lvdl on 16/08/6.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "GestureView.h"
#import "PasswordButton.h"
#import "PasswordManage.h"

@interface GestureView ()
{
    CGPoint lineStartPoint;
    CGPoint lineEndPoint;
    
    NSMutableArray *touchesArray;
    NSMutableArray *touchedArray;
    BOOL success;

}

// 线条层
@property (nonatomic, strong) CAShapeLayer *lineLayer;
@end

@implementation GestureView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //
        touchesArray = [NSMutableArray array];
        touchedArray = [NSMutableArray array];
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        success = YES;
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint;
    UITouch *touch = [touches anyObject];
    [touchesArray removeAllObjects];
    [touchedArray removeAllObjects];
    success = YES;
    if (touch) {
        touchPoint = [touch locationInView:self];
        for (int i=0; i < _buttonArray.count; i++) {
            PasswordButton *buttonTemp = (PasswordButton *)[_buttonArray objectAtIndex:i];
            buttonTemp.success = YES;
            buttonTemp.selected = NO;
            if (CGRectContainsPoint(buttonTemp.frame, touchPoint)) {
                
                CGRect frameTemp = buttonTemp.frame;
                CGPoint point = CGPointMake(frameTemp.origin.x+frameTemp.size.width/2,frameTemp.origin.y+frameTemp.size.height/2);
                NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%f",point.x],@"x",[NSString stringWithFormat:@"%f",point.y],@"y", nil];
                [touchesArray addObject:dict];
                lineStartPoint = touchPoint;
            }
            [buttonTemp setNeedsDisplay];
        }
        
        [self setNeedsDisplay];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint;
    UITouch *touch = [touches anyObject];
    if (touch) {
        touchPoint = [touch locationInView:self];
        for (int i=0; i < _buttonArray.count; i++) {
            PasswordButton *buttonTemp = (PasswordButton *)[_buttonArray objectAtIndex:i];
            if (CGRectContainsPoint(buttonTemp.frame, touchPoint)) {
                //已经设置过的
                if ([touchedArray containsObject:[NSString stringWithFormat:@"num%d",i]]) {
                    lineEndPoint = touchPoint;
                    [self setNeedsDisplay];
                    return;
                }
                [touchedArray addObject:[NSString stringWithFormat:@"num%d",i]];
                [buttonTemp setSelected:YES];
                [buttonTemp setNeedsDisplay];
                
                CGRect frameTemp = buttonTemp.frame;
                CGPoint point = CGPointMake(frameTemp.origin.x+frameTemp.size.width/2,frameTemp.origin.y+frameTemp.size.height/2);
                NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%f",point.x],@"x",[NSString stringWithFormat:@"%f",point.y],@"y",[NSString stringWithFormat:@"%d",i],@"num", nil];
                [touchesArray addObject:dict];
                break;
            }
        }
        
        lineEndPoint = touchPoint;
        [self setNeedsDisplay];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSMutableString *resultString=[NSMutableString string];
    for ( NSDictionary * num in touchesArray ){
        if(![num objectForKey:@"num"])break;
        [resultString appendString:[num objectForKey:@"num"]];
    }
    NSLog(@"resultString:%@",resultString);
    
    if (resultString.length > 0) {
        if(_style==VerifyMode){
            if ([_caseDelegate respondsToSelector:@selector(verification:)]) {
                success = [_caseDelegate verification:resultString];
            }
        }
        else {
            if ([_caseDelegate respondsToSelector:@selector(resetPassword:)]) {
                success = [_caseDelegate resetPassword:resultString];
            }
        }
    }
    else {
        success = YES;
    }
    
    for (int i=0; i<touchesArray.count; i++) {
        NSInteger selection = [[[touchesArray objectAtIndex:i] objectForKey:@"num"]intValue];
        PasswordButton * buttonTemp = ((PasswordButton *)[_buttonArray objectAtIndex:selection]);
        [buttonTemp setSuccess:success];
        
        [buttonTemp setNeedsDisplay];
    }
//    [self setNeedsDisplay];
    
    // --- >
    // 最终的 手势图案
    [self endDrawRect];
    // --- >
}

//重新开始画图
- (void)enterArgin
{
    [touchesArray removeAllObjects];
    [touchedArray removeAllObjects];
    for (int i=0; i<_buttonArray.count; i++) {
        PasswordButton * buttonTemp = ((PasswordButton *)[_buttonArray objectAtIndex:i]);
        [buttonTemp setSelected:NO];
        [buttonTemp setSuccess:YES];
        [buttonTemp setNeedsDisplay];
    }
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // --- >
    if (_lineLayer) {
        [_lineLayer removeFromSuperlayer];
    }

    _lineLayer = [CAShapeLayer layer];
    _lineLayer.lineCap = kCALineCapRound;
    _lineLayer.lineJoin = kCALineJoinRound;
    _lineLayer.lineWidth = 5.0;
    [self.layer addSublayer:_lineLayer];
    
    if (success) {
        _lineLayer.strokeColor = [UIColor colorWithRed:255/255.f green:100/255.f blue:100/255.f alpha:0.6].CGColor;
    }
    else {
        _lineLayer.strokeColor = [UIColor colorWithRed:208/255.f green:36/255.f blue:36/255.f alpha:0.6].CGColor;
    }
    
    /*
     */
    if (![PasswordManage isOnWithShowTrack]) {
        _lineLayer.strokeColor = [UIColor clearColor].CGColor;
    }
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline setLineWidth:5.0f];
    [progressline setLineCapStyle:kCGLineCapRound];
    [progressline setLineJoinStyle:kCGLineJoinRound];
    
    // 轨迹
    for (NSInteger i=0; i<touchesArray.count; i++) {
        
        if (![[touchesArray objectAtIndex:i] objectForKey:@"num"]) { //防止过快滑动产生垃圾数据
            [touchesArray removeObjectAtIndex:i];
            continue;
        }
    
        if (i == 0) {
            CGPoint startPoint = CGPointMake([[[touchesArray objectAtIndex:0] objectForKey:@"x"] floatValue], [[[touchesArray objectAtIndex:0] objectForKey:@"y"] floatValue]);
            [progressline moveToPoint:startPoint];
        }
    
        if (i< touchesArray.count - 1) {
            CGPoint point = CGPointMake([[[touchesArray objectAtIndex:i+1] objectForKey:@"x"] floatValue],[[[touchesArray objectAtIndex:i+1] objectForKey:@"y"] floatValue]);
            [progressline addLineToPoint:point];
            [progressline moveToPoint:point];
        }
        else{
            if (success) {
                CGPoint point = CGPointMake(lineEndPoint.x,lineEndPoint.y);
                [progressline addLineToPoint:point];
                [progressline moveToPoint:point];
            }
        }
        // 轨迹
    }
    
    
    _lineLayer.path = progressline.CGPath;
    // --- >
}

// --- >
// 最终的 手势图案
- (void)endDrawRect
{
    // --- >
    if (_lineLayer) {
        [_lineLayer removeFromSuperlayer];
    }
    _lineLayer = [CAShapeLayer layer];
    _lineLayer.lineCap = kCALineCapRound;
    _lineLayer.lineJoin = kCALineJoinRound;
    _lineLayer.lineWidth = 5.0;

    [self.layer addSublayer:_lineLayer];
    
    if (success) {
        _lineLayer.strokeColor = [UIColor colorWithRed:255/255.f green:100/255.f blue:100/255.f alpha:0.6].CGColor;
    }
    else {
        _lineLayer.strokeColor = [UIColor colorWithRed:208/255.f green:36/255.f blue:36/255.f alpha:0.6].CGColor;
    }

    /*
     */
    if (![PasswordManage isOnWithShowTrack]) {
       _lineLayer.strokeColor = [UIColor clearColor].CGColor;
    }

    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline setLineWidth:5.0f];
    [progressline setLineCapStyle:kCGLineCapRound];
    [progressline setLineJoinStyle:kCGLineJoinRound];
    
    // 轨迹
    for (NSInteger i=0; i<touchesArray.count; i++) {
        if (![[touchesArray objectAtIndex:i] objectForKey:@"num"]) { //防止过快滑动产生垃圾数据
            [touchesArray removeObjectAtIndex:i];
            continue;
        }
        
        if (i == 0) {
            CGPoint startPoint = CGPointMake([[[touchesArray objectAtIndex:0] objectForKey:@"x"] floatValue], [[[touchesArray objectAtIndex:0] objectForKey:@"y"] floatValue]);
            [progressline moveToPoint:startPoint];
        }
        
        if (i< touchesArray.count - 1) {
            CGPoint point = CGPointMake([[[touchesArray objectAtIndex:i+1] objectForKey:@"x"] floatValue],[[[touchesArray objectAtIndex:i+1] objectForKey:@"y"] floatValue]);
            [progressline addLineToPoint:point];
            [progressline moveToPoint:point];
        }
        else{
            if (success) {
                //                CGPoint point = CGPointMake(lineEndPoint.x,lineEndPoint.y);
                CGPoint point = CGPointMake([[[touchesArray objectAtIndex:i] objectForKey:@"x"] floatValue],[[[touchesArray objectAtIndex:i] objectForKey:@"y"] floatValue]);
                [progressline addLineToPoint:point];
                [progressline moveToPoint:point];
            }
        }

        // 轨迹
    }
    
    _lineLayer.path = progressline.CGPath;
    
    if (!success) {

        [self performSelector:@selector(enterArgin) withObject:nil afterDelay:1.0f];
    }
}
// --- >

@end
