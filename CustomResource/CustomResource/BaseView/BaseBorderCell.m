//
//  BaseCell.m
//  celllien
//
//  Created by jiaxin on 15/12/9.
//  Copyright © 2015年 jiaxin. All rights reserved.
//

#import "BaseBorderCell.h"

#define Width self.contentView.frame.size.width
#define Height self.contentView.frame.size.height

@implementation BaseBorderCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    BaseBorderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[BaseBorderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //一定要这里设置style，而不能在上面的判断里面，因为cell重用的时候，只要有不同的地方都应该重新设置，否则拿到cell的style就是上一个的样式而自己却没有进行修改
    if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        cell.borderStyle = BaseCellBorderStyleAllRound;
    }else if (indexPath.row == 0) {
        cell.borderStyle = BaseCellBorderStyleTopRound;
    }else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        cell.borderStyle = BaseCellBorderStyleBottomRound;
    }else {
        cell.borderStyle = BaseCellBorderStyleNoRound;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //配置默认值
        self.contentBorderColor = [UIColor lightGrayColor];
        self.contentBackgroundColor = [UIColor whiteColor];
        self.contentBorderWidth = 2.0;
        self.contentMargin = 10.0;
        self.contentCornerRadius = CGSizeMake(5, 5);
    }
    return self;
}

- (void)setBorderStyleWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        self.borderStyle = BaseCellBorderStyleAllRound;
    }else if (indexPath.row == 0) {
        self.borderStyle = BaseCellBorderStyleTopRound;
    }else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        self.borderStyle = BaseCellBorderStyleBottomRound;
    }else {
        self.borderStyle = BaseCellBorderStyleNoRound;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //在这里设置才能获取到真正显示时候的宽度，而不是原始的
    for (UIView *subview in self.contentView.superview.subviews) {
        if ([NSStringFromClass(subview.class) hasSuffix:@"SeparatorView"]) {
            
            CGRect frame = subview.frame;
//            subview.backgroundColor = [UIColor redColor];
            frame.size.width = self.bounds.size.width - 2 * self.contentMargin;
            frame.origin.x = self.contentMargin;
            subview.frame =frame;
            
        }
    }
    [self setupBorder];
}

- (void)setupBorder
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = self.contentBorderWidth;
    layer.strokeColor = self.contentBorderColor.CGColor;
    layer.fillColor =  [UIColor clearColor].CGColor;
    
    UIView *view = [[UIView alloc] initWithFrame:self.contentView.bounds];
    [view.layer insertSublayer:layer atIndex:0];
    view.backgroundColor = [UIColor whiteColor];
    //用自定义的view代替cell的backgroundView
    self.backgroundView = view;
    
    CGRect rect = CGRectMake(self.contentMargin, 0, Width - 2*self.contentMargin, Height);
    switch (self.borderStyle) {
        case BaseCellBorderStyleNoRound:
        {
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(CGRectGetMinX(rect) + 0.5 * self.contentBorderWidth, CGRectGetMaxY(rect))];
                [path addLineToPoint:CGPointMake(CGRectGetMinX(rect) + 0.5 * self.contentBorderWidth, CGRectGetMinY(rect))];
          
            UIBezierPath *path1 = [UIBezierPath bezierPath];
            [path1 moveToPoint:CGPointMake(CGRectGetMaxX(rect) - 0.5 * self.contentBorderWidth, CGRectGetMinY(rect))];
            [path1 addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - 0.5 * self.contentBorderWidth, CGRectGetMaxY(rect))];
            [path appendPath:path1];
            layer.path = path.CGPath;
        }
            break;
        case BaseCellBorderStyleTopRound:
        {
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(CGRectGetMinX(rect) + 0.5 * self.contentBorderWidth, CGRectGetMaxY(rect))];
            [path addLineToPoint:CGPointMake(CGRectGetMinX(rect) + 0.5 * self.contentBorderWidth, CGRectGetMinY(rect) + self.contentCornerRadius.height)];
         
            [path addArcWithCenter:CGPointMake(CGRectGetMinX(rect) + self.contentCornerRadius.width, CGRectGetMinY(rect) + self.contentCornerRadius.height) radius:self.contentCornerRadius.width - 0.5 * self.contentBorderWidth startAngle:M_PI endAngle:M_PI * 1.5 clockwise:YES];
    
            [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - self.contentCornerRadius.width,CGRectGetMinY(rect) + 0.5 * self.contentBorderWidth )];
            
             [path addArcWithCenter:CGPointMake(CGRectGetMaxX(rect) - self.contentCornerRadius.width, CGRectGetMinY(rect) + self.contentCornerRadius.height) radius:self.contentCornerRadius.width - 0.5 * self.contentBorderWidth startAngle:M_PI *1.5 endAngle:0 clockwise:YES];
            [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - 0.5 * self.contentBorderWidth, CGRectGetMaxY(rect))];
           
            layer.path = path.CGPath;
        }
            break;
        case BaseCellBorderStyleBottomRound:
        {
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(CGRectGetMaxX(rect) - 0.5 * self.contentBorderWidth, CGRectGetMinY(rect))];
            [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - 0.5 * self.contentBorderWidth, CGRectGetMaxY(rect) - self.contentCornerRadius.height)];
            
            [path addArcWithCenter:CGPointMake(CGRectGetMaxX(rect) - self.contentCornerRadius.width, CGRectGetMaxY(rect) - self.contentCornerRadius.height) radius:self.contentCornerRadius.width - 0.5 * self.contentBorderWidth  startAngle:0 endAngle:M_PI_2 clockwise:YES];
        
            [path addLineToPoint:CGPointMake(CGRectGetMinX(rect) + self.contentCornerRadius.width,CGRectGetMaxY(rect) - 0.5 * self.contentBorderWidth )];
            
           [path addArcWithCenter:CGPointMake(CGRectGetMinX(rect) + self.contentCornerRadius.width, CGRectGetMaxY(rect) - self.contentCornerRadius.height) radius:self.contentCornerRadius.width - 0.5 * self.contentBorderWidth startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            
            [path addLineToPoint:CGPointMake(CGRectGetMinX(rect) + 0.5 * self.contentBorderWidth, CGRectGetMinY(rect))];
           
            layer.path = path.CGPath;
        }
            break;
        case BaseCellBorderStyleAllRound:
        {
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:self.contentCornerRadius];
            layer.path = path.CGPath;
        }
            break;
        default:
            break;
    }
}

@end
