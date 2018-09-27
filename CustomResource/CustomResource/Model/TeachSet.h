//
//  TeachSet.h
//  CustomResource
//
//  Created by 汤天明 on 2018/9/18.
//  Copyright © 2018年 汤天明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@class Member;
@class TeachSet;

@protocol JSTeachSetExportProtocal <JSExport>

@property (nonatomic, copy) NSString * name;

+ (TeachSet *)teachSet;
- (void)initwithName:(NSString *)name members:(NSArray <Member *>*)members;

-(NSArray<Member *> *)currentMembers;

JSExportAs(add, -(BOOL)addMember:(Member *)member);



@end


NS_ASSUME_NONNULL_BEGIN


@interface TeachSet : NSObject<JSTeachSetExportProtocal>

@property (nonatomic, copy) NSString * name;

+(TeachSet *)teachSet;

- (instancetype)initWithName:(NSString *)name members:(NSArray<Member *> *)members;

- (BOOL)addMember:(Member *)member;

-(NSArray<Member *> *)currentMembers;

+ (BOOL)maxMemberCount;

@end

NS_ASSUME_NONNULL_END
