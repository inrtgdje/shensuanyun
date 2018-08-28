//
//  PictureAndTitleButton.m
//  ppseas
//
//  Created by 汤天帅 on 16/2/24.
//  Copyright © 2016年 汤天帅. All rights reserved.
//

#import "PictureAndTitleButton.h"

typedef enum
{
    Normaol,
    Custom,
}ButtonTitleType;


@interface PictureAndTitleButton ()

@property (nonatomic,assign)CGRect imageRect;
@property (nonatomic,assign)CGRect titleRect;

@property (nonatomic,assign)ButtonTitleType buttonTitleType;

@property (nonatomic,weak)UILabel *customTitleLabel;

@end

@implementation PictureAndTitleButton

//init方法
-(instancetype)initWithImageRect:(CGRect)imageRect andWithTitleRect:(CGRect)titleRect
{

    self=[super init];
    
    if(self)
    {
        _imageRect=imageRect;
        
        _titleRect=titleRect;
        
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    
    return self;
}


-(instancetype)initWithImageRect:(CGRect)imageRect andWithTitleRect:(CGRect)titleRect buttonTitleType:(ButtonTitleType)buttonTitleType
{
    self=[super init];
    
    if(self)
    {
        _imageRect=imageRect;
        
        _titleRect=titleRect;
        
        _customTitleLabel.hidden=NO;
        
    }
    
    return self;
}

//get方法
-(UILabel *)customTitleLabel
{
    if (!_customTitleLabel)
    {
        UILabel *label=[[UILabel alloc]initWithFrame:_titleRect];
        
        [self addSubview:label];
    }
    
    return _customTitleLabel;
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return _imageRect;
}


-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return _titleRect;
}


-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    if (_customTitleLabel)
    {
        _customTitleLabel.text=title;
    }
    else
    {
        [super setTitle:title forState:state];
    }
}


@end
