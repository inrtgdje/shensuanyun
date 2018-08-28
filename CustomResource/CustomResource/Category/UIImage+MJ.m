//
//  UIImage+MJ.m
//
//  Created by teacher on 14-6-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIImage+MJ.h"

@implementation UIImage (MJ)

+ (UIImage *)imageWithName:(NSString *)name
{
    // 0.需要返回的图片
    UIImage *image = nil;
    // 1.判断手机型号
    if (375 == (NSInteger)kScreenWidth) {
        NSString *iphone6 = [name stringByAppendingString:@"_6"];
        image = [self imageNamed:iphone6];
    }
    if (414 == (NSInteger)kScreenWidth) {
        NSString *iphone6 = [name stringByAppendingString:@"_6plus"];
        image = [self imageNamed:iphone6];
    }
    if (480 == (NSInteger)kScreenWidth) {
        NSString *iphone6 = [name stringByAppendingString:@"_4s"];
        image = [self imageNamed:iphone6];
    }
//    FHLog(@"%f",ScreenSize.height);
    // 2.图片不存在
    if (image == nil) {
        image = [self imageNamed:name];
    }
    
    return image;
}

+ (UIImage *)resizableImage:(NSString *)name
{
    return [self resizableImage:name leftRatio:0.5 topRatio:0.5];
}

+ (UIImage *)resizableImage:(NSString *)name leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio
{
//    UIImage *image = [self imageWithName:name];
    UIImage *image = [self imageNamed:name];
    CGFloat left = image.size.width * leftRatio;
    CGFloat top = image.size.height * topRatio;
    return [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
}

+ (instancetype)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
