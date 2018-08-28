//
//  TMBaseTextField.m
//  shensuanyun
//
//  Created by 汤天明 on 2018/2/9.
//  Copyright © 2018年 shensuanyun. All rights reserved.
//

#import "TMBaseTextField.h"

@implementation TMBaseTextField

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    UIMenuController * menuController = [UIMenuController sharedMenuController];
    
    if(menuController) {
        
        [UIMenuController sharedMenuController].menuVisible=NO;
        
    }
    
    return NO;
    
  
}

@end
