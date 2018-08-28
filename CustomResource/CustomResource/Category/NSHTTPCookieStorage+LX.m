//
//  NSHTTPCookieStorage+Knight.m
//  knight
//
//  Created by 梁立行 on 16/8/2.
//
//

#import "NSHTTPCookieStorage+LX.h"
#define kCookieKey    @"com.junling.cookie"


@implementation NSHTTPCookieStorage (LX)

- (void)saveCookie
{
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:cookiesData forKey:kCookieKey];
    [defaults synchronize];
}

- (void)loadCookie
{
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: kCookieKey]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in cookies){
        [cookieStorage setCookie: cookie];
    }
}


- (NSHTTPCookie*)currentCookie
{
    return [[[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies] lastObject];
}

- (void)clearCookie
{
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey: kCookieKey]];
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in cookies){
        [cookieStorage deleteCookie:cookie];
    }
}








@end
