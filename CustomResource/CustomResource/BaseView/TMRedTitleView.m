//
//  TMRedTitleView.m
//  shensuanyun
//
//  Created by 汤天明 on 2018/1/12.
//  Copyright © 2018年 shensuanyun. All rights reserved.
//

#import "TMRedTitleView.h"
#import "UIColor+YYAdd.h"
#import <UIView+MJExtension.h>
@interface TMRedTitleView  ()
@property(nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIView *line;
@end

@implementation TMRedTitleView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(12, (frame.size.height - 16) * 0.5, 4, 16)];
        redView.backgroundColor = [UIColor colorWithRGB:0xff753e];
        redView.layer.cornerRadius = 2.0;
        redView.clipsToBounds = YES;
        [self addSubview:redView];
        [self addSubview:self.titleLabel];
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height - 0.5, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRGB:0xe5e5e5];
        self.line = line;
        [self addSubview:self.line];
        self.line.hidden = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        CGFloat height = 20;
        CGFloat margin = 21;
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin, (self.mj_h - height) * 0.5, self.mj_w - 2 * margin, height)];
        _titleLabel.textColor = [UIColor colorWithRGB:0x333333];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}


-(void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}


- (void)setupAttributeText:(NSAttributedString *)attributeText{
    self.titleLabel.attributedText = attributeText;
}

-(void)setupBottomLineHidden:(BOOL)hidden{
    self.line.hidden = hidden;
}
@end
