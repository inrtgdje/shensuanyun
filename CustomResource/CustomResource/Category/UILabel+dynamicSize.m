//
//  UILabel+dynamicSize.m
//  shensuanyun
//
//  Created by 梁立行 on 2017/3/22.
//  Copyright © 2017年 shensuanyun. All rights reserved.
//

#import "UILabel+dynamicSize.h"

@implementation UILabel (dynamicSize)

-(float)resizeToFit{
    float height = [self expectedHeight];
    CGRect newFrame = [self frame];
    newFrame.size.height = height;
    [self setFrame:newFrame];
    return newFrame.origin.y + newFrame.size.height;
}

-(float)expectedHeight{
    [self setNumberOfLines:0];
    [self setLineBreakMode:NSLineBreakByWordWrapping];
    
    CGSize maximumLabelSize = CGSizeMake(self.frame.size.width,9999);
    
    CGRect rect = [self.text boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :self.font} context:nil];
   
    return rect.size.height;
}


@end
