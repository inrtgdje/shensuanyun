//
//  NSString+Format.m
//  shensuanyun
//
//  Created by 梁立行 on 2017/3/17.
//  Copyright © 2017年 shensuanyun. All rights reserved.
//

#import "NSString+Format.h"
#import <sys/utsname.h>

@implementation NSString (Format)

+ (NSString*) formatAmount:(NSString*)number
{
    if (number.length ==0) {
        return @"";
    }
    NSMutableString *resultStr = [NSMutableString stringWithFormat:@"%.2f",[number doubleValue]];
    
    BOOL bellowZero = NO;
    if ([number doubleValue]<0)
    {
        bellowZero = YES;
        [resultStr replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
    }
    NSInteger count = ([resultStr length]-1)/3-2;
    int mod = [resultStr length]%3==0?3:[resultStr length]%3;
    
    for (int i=0; i<=count; i++)
    {
        [resultStr insertString:@"," atIndex:mod+3*(count-i)];
    }
    
    if (bellowZero)
    {
        [resultStr insertString:@"-" atIndex:0];
    }
    
    return resultStr;
}

+(NSString *)formatOfBankCardNum:(NSString *)cardNum
{
    NSString *tempStr = cardNum;
    NSInteger size =(tempStr.length / 4);
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    
    for (int n = 0;n < size; n++){
        
        [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(n*4, 4)]];
    }
    
    [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(size*4, (tempStr.length % 4))]];
    tempStr = [tmpStrArr componentsJoinedByString:@" "];
    
    return tempStr;
    
}


-(BOOL)checkPassWord
{
    //6-26位数字、字母、符号中的两种组成
   // NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
    NSString *regex =  @"^(?=.*[a-zA-Z0-9].*)(?=.*[a-zA-Z\\W].*)(?=.*[0-9\\W].*).{6,16}$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:self]) {
        return YES ;
    }else
        return NO;
}

- (BOOL)isPhoneNum
{
    return [self isMobileNumber]||[self isTelePhoneNum];
}


- (BOOL)isEmail{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
    
    return YES;
}

- (BOOL)isMobileNumber {
    
    NSString *moble = @"^1(3|4|5|7|8)\\d{9}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", moble];
    
    return [regextestmobile evaluateWithObject:self];
}


-(BOOL)isTelePhoneNum
{
    NSString *regex =  @"^(0[0-9]{2})-?\\d{8}$|^(0[0-9]{3}-?(\\d{7,8}))$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:self]) {
        return YES ;
    }else
        return NO;

}


- (BOOL)isCharactorOrNum{
    
    NSString *regex =  @"^[a-zA-Z0-9]+$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:self]) {
        return YES ;
    }else
        return NO;
}

+ (NSString *)nameFromCode:(NSString *)code
{
    if (code == nil) {
        return nil;
    }else if (code.length == 0)
        return @"";
    NSString *name = nil;
    NSArray* globalArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"globalDictionary"] objectForKey:@"result"];
    for (NSDictionary *dict in globalArray) {
        if ([dict[@"code"]isEqualToString:code]) {
            name = dict[@"name"];
            break;
        }
    }
    return name;
}


+ (NSString *)demandProductNameFromCode:(NSString *)code
{
    if (code.length == 0) {
        return nil;
    }
  __block  NSString *demandProductName = nil;
    NSDictionary* productDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"allProductDict"];
    [productDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if([key isEqualToString:code]){
            demandProductName = [NSString stringWithFormat:@"%@",obj];
        }
        
    }];
    
    return demandProductName;
    
}


+ (NSString *)stringFromsecs:(NSString *)secondsString
{
    NSTimeInterval timer = secondsString.doubleValue;
    NSDate *tempDate = [NSDate dateWithTimeIntervalSince1970:timer/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:tempDate];
}


+ (NSString *)fileSizeFromNum:(NSInteger)size
{
    NSString *audioSize = nil;
    if (size > 1024 *1024) {
        CGFloat mbSize = size /(1024 *1024.0);
        audioSize = [NSString stringWithFormat:@"%.2fMB",mbSize];
    }else
    {
        CGFloat bSize = size/1024.0;
        audioSize = [NSString stringWithFormat:@"%.2fKB",bSize];
    }
    return audioSize;

}

+ (NSString *)iphoneType
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if([platform isEqualToString:@"iPhone1,1"])  return@"iPhone 2G";
    
    if([platform isEqualToString:@"iPhone1,2"])  return@"iPhone 3G";
    
    if([platform isEqualToString:@"iPhone2,1"])  return@"iPhone 3GS";
    
    if([platform isEqualToString:@"iPhone3,1"])  return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,2"])  return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,3"])  return@"iPhone 4";
    
    if([platform isEqualToString:@"iPhone4,1"])  return@"iPhone 4S";
    
    if([platform isEqualToString:@"iPhone5,1"])  return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,2"])  return@"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,3"])  return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone5,4"])  return@"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone6,1"])  return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone6,2"])  return@"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone7,1"])  return@"iPhone 6 Plus";
    
    if([platform isEqualToString:@"iPhone7,2"])  return@"iPhone 6";
    
    if([platform isEqualToString:@"iPhone8,1"])  return@"iPhone 6s";
    
    if([platform isEqualToString:@"iPhone8,2"])  return@"iPhone 6s Plus";
    
    if([platform isEqualToString:@"iPhone8,4"])  return@"iPhone SE";
    
    if([platform isEqualToString:@"iPhone9,1"])  return@"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,2"])  return@"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone10,1"]) return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,4"]) return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,2"]) return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,5"]) return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,3"]) return@"iPhone X";
    
    if([platform isEqualToString:@"iPhone10,6"]) return@"iPhone X";
    
    if([platform isEqualToString:@"iPod1,1"])  return@"iPod Touch 1G";
    
    if([platform isEqualToString:@"iPod2,1"])  return@"iPod Touch 2G";
    
    if([platform isEqualToString:@"iPod3,1"])  return@"iPod Touch 3G";
    
    if([platform isEqualToString:@"iPod4,1"])  return@"iPod Touch 4G";
    
    if([platform isEqualToString:@"iPod5,1"])  return@"iPod Touch 5G";
    
    if([platform isEqualToString:@"iPad1,1"])  return@"iPad 1G";
    
    if([platform isEqualToString:@"iPad2,1"])  return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,2"])  return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,3"])  return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,4"])  return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,5"])  return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,6"])  return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,7"])  return@"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad3,1"])  return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,2"])  return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,3"])  return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,4"])  return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,5"])  return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,6"])  return@"iPad 4";
    
    if([platform isEqualToString:@"iPad4,1"])  return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,2"])  return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,3"])  return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,4"])  return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,5"])  return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,6"])  return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,7"])  return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,8"])  return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,9"])  return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad5,1"])  return@"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,2"])  return@"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,3"])  return@"iPad Air 2";
    
    if([platform isEqualToString:@"iPad5,4"])  return@"iPad Air 2";
    
    if([platform isEqualToString:@"iPad6,3"])  return@"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,4"])  return@"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,7"])  return@"iPad Pro 12.9";
    
    if([platform isEqualToString:@"iPad6,8"])  return@"iPad Pro 12.9";
    
    if([platform isEqualToString:@"i386"])  return@"iPhone Simulator";
    
    if([platform isEqualToString:@"x86_64"])  return@"iPhone Simulator";
    
    return platform;
    
   
    
}


+(NSArray *)dicArrayWith:(NSString *)dicPreStr
{
    if (dicPreStr.length == 0) {
        return nil;
    }
    NSArray *temp = nil;
    NSArray *globalArray = [[[NSUserDefaults standardUserDefaults]objectForKey:@"downMenuGlobalDictionary"] objectForKey:@"result"];
    for (NSDictionary *dict in globalArray) {
        if ([dict[@"dicType"]isEqualToString:dicPreStr]) {
            temp = dict[@"dicList"];
        }
    }
    
    return temp;
    
}






+(BOOL)checkUserID:(NSString *)userID { //长度不为18的都排除掉
    if (userID.length!=18){
        return NO;
        
    } //校验格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:userID];
    
    if (!flag) {
        return flag;
        //格式错误
        
    }else { //格式正确在判断是否合法 //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"]; //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++) {
            NSInteger subStrIndex = [[userID substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        } //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11; //得到最后一位身份证号码
        NSString * idCardLast= [userID substringWithRange:NSMakeRange(17, 1)]; //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2) {
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            { return YES;
                
            }else {
                return NO;
                
            }
            
        }else{ //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return YES;
            }
            else { return NO;
                
            }
            
        }
        
    }
    
}
    
    
  

@end
