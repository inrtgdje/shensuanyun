//
//  NoAddressView.m
//  CustomResource
//
//  Created by 汤天明 on 2018/10/15.
//  Copyright © 2018 汤天明. All rights reserved.
//

#import "NoAddressView.h"
#import <Masonry.h>
@implementation NoAddressView

-(instancetype)initWithFrame:(CGRect)frame actionBlock:( void (^)(void))action{
    if (self = [super initWithFrame:frame]) {
        if (action) {
            _action = action;
        }
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame actionBlock:nil];
}

- (void)setupSubViews{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    imageView.image = [UIImage imageNamed:@"image"];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.centerX.equalTo(self);
        make.width.height.equalTo(@100);
    }];
    
    UILabel *noSetting = [[UILabel alloc]init];
    noSetting.textColor = [UIColor redColor];
    noSetting.font = [UIFont fontWithName:@"Roboto" size:14];
    noSetting.textAlignment = NSTextAlignmentCenter;
    noSetting.text = @"暂未设置";
    [self addSubview:noSetting];
    [noSetting mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(17);
        make.centerX.equalTo(self);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    UILabel *noAddressFlag = [[UILabel alloc]init];
    noAddressFlag.textColor = [UIColor redColor];
    noAddressFlag.font = [UIFont fontWithName:@"Roboto" size:12];
    noAddressFlag.textAlignment = NSTextAlignmentCenter;
    noAddressFlag.text = @"没有收获地址寄不了快递哦";
    [self addSubview:noAddressFlag];
    [noAddressFlag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(noSetting.mas_bottom).offset(15);
        make.centerX.equalTo(self);
        make.height.equalTo(@17);
        make.width.greaterThanOrEqualTo(@100);
    }];
    
    UIButton *addAddressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addAddressBtn setTitle:@"新增地址" forState:UIControlStateNormal];
    [addAddressBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    addAddressBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    addAddressBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [addAddressBtn addTarget:self action:@selector(addAddressClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addAddressBtn];
    addAddressBtn.layer.cornerRadius = 10;
    addAddressBtn.layer.borderWidth = 1;
    addAddressBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [addAddressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(noAddressFlag).offset(10);
        make.centerX.equalTo(self);
        make.height.equalTo(@30);
        make.width.greaterThanOrEqualTo(@80);
    }];
}


-(void) addAddressClick:(UIButton *)sender{
    
    if (self.action) {
        self.action();
    }
}
@end
