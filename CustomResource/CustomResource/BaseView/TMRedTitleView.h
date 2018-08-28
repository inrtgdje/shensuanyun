//
//  TMRedTitleView.h
//  shensuanyun
//
//  Created by 汤天明 on 2018/1/12.
//  Copyright © 2018年 shensuanyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMRedTitleView : UIView

@property(nonatomic,copy) NSString *title;

-(void)setupAttributeText:(NSAttributedString *)attributeText;

-(void)setupBottomLineHidden:(BOOL)hidden;

@end
