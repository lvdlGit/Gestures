//
//  GestureCell.m
//  GesturesDemo
//
//  Created by lvdl on 16/9/20.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "GestureCell.h"

@interface GestureCell ()

@end

@implementation GestureCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createViews];
    }
    return self;
}

- (void)createViews
{
    _title = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 110, 49)];
    [self.contentView addSubview:_title];
    _title.font = kFont(16);
    _title.textColor = RGBA(92, 92, 92, 1);
    
    _arrow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 18, 7, 12.5)];
    [self.contentView addSubview:_arrow];
    _arrow.image = [UIImage imageNamed:@"more_icon_arrow.png"];
    _arrow.right = SCREEN_WIDTH_IPHONE - 15;
    
    _content = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 49)];
    [self.contentView addSubview:_content];
    _content.font = kFont(14);
    _content.textColor = RGBA(194, 194, 194, 1);
    _content.textAlignment = NSTextAlignmentRight;
    _content.right = _arrow.left - 10;
    
    _switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 12, 57, 35)];
    [self.contentView addSubview:_switchView];
    _switchView.hidden = YES;
    
    _switchView.right = SCREEN_WIDTH_IPHONE - 15;
    _switchView.onTintColor = kGreenColor;
    
    CGRect topFrame = CGRectMake(0, 0, SCREEN_WIDTH_IPHONE, 0.5);
    _topLine = [self createLineWithFrame:topFrame];
    
    CGRect bottomFrame = CGRectMake(0, 48.5, SCREEN_WIDTH_IPHONE, 0.5);
    _bottomLine = [self createLineWithFrame:bottomFrame];
    
    CGRect middleFrame = CGRectMake(15, 48.5, SCREEN_WIDTH_IPHONE - 15, 0.5);
    _middleLine = [self createLineWithFrame:middleFrame];
}


- (UIView *)createLineWithFrame:(CGRect)frame
{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    [self.contentView addSubview:line];
    line.backgroundColor = kLineColor;
    return line;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
