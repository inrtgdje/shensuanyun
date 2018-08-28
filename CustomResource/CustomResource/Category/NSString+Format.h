//
//  NSString+Format.h
//  shensuanyun
//
//  Created by 梁立行 on 2017/3/17.
//  Copyright © 2017年 shensuanyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Format)


/**
 金额格式化显示

 @param number 输入金额
 @return 格式化的金额
 */
+ (NSString*) formatAmount:(NSString*)number;

+ (NSString *)formatOfBankCardNum:(NSString *)cardNum;

/**
 密码合格性判断 3种中的两种
 */
-(BOOL)checkPassWord;

- (BOOL)isPhoneNum;

- (BOOL)isEmail;

- (BOOL)isCharactorOrNum;
/**
    是否手机号码
 */
- (BOOL)isMobileNumber;


/**
 是否固定电话 含-
 */
-(BOOL)isTelePhoneNum;
/**
 将code转换成name
 */
+ (NSString *)nameFromCode:(NSString *)code;


+ (NSString *)demandProductNameFromCode:(NSString *)code;

+ (NSString *)stringFromsecs:(NSString *)secondsString;


+ (NSString *)fileSizeFromNum:(NSInteger)size;

+ (NSString *)iphoneType;

+ (NSArray *)dicArrayWith:(NSString *)dicPreStr;



@end
