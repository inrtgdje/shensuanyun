//
//  NSHTTPCookieStorage+Knight.h
//  knight
//  保存于取消cookie
//  Created by 梁立行 on 16/8/2.
//
//

#import <Foundation/Foundation.h>

@interface NSHTTPCookieStorage (LX)

/**
 *  保存cookie
 */
- (void)saveCookie;

/**
 *  加载cookie
 */
- (void)loadCookie;


/**
 *  当前Cookie
 */
- (NSHTTPCookie*)currentCookie;


/**
 *  清除cookie
 */
- (void)clearCookie;

@end
