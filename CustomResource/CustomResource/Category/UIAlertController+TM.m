//
//  UIAlertController+TM.m
//  shensuanyun
//
//  Created by 汤天明 on 2018/5/3.
//  Copyright © 2018年 shensuanyun. All rights reserved.
//

#import "UIAlertController+TM.h"

@implementation UIAlertController (TM)

+(instancetype)alertControllerWithAlertTitle:(NSString *)title
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:action];
    
    return controller;
}

@end
