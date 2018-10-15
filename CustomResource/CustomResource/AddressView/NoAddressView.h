//
//  NoAddressView.h
//  CustomResource
//
//  Created by 汤天明 on 2018/10/15.
//  Copyright © 2018 汤天明. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface NoAddressView : UIView

@property(nonatomic,copy) void (^action)(void);


- (instancetype)initWithFrame:(CGRect)frame actionBlock:( void (^)(void))action;

@end


