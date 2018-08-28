//
//  UIImage+MJ.h
//
//  Created by teacher on 14-6-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenFrame [UIScreen mainScreen].bounds
@interface UIImage (MJ)
/**
 *  返回一张图片
 *
 *  @param name 图片名
 */
+ (instancetype)imageWithName:(NSString *)name;

/**
 *  返回一张能自由拉伸的图片
 *
 *  @param name 图片名
 */
+ (instancetype)resizableImage:(NSString *)name;

/**
 *  返回一张能自由拉伸的图片
 *
 *  @param name      图片名
 *  @param leftRatio 左边有多少比例不需要拉伸(0~1)
 *  @param topRatio  顶部有多少比例不需要拉伸(0~1)
 */
+ (instancetype)resizableImage:(NSString *)name leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio;


+ (instancetype)imageWithColor:(UIColor*)color;
@end
