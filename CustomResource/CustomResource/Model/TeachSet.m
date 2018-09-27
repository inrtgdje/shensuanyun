//
//  TeachSet.m
//  CustomResource
//
//  Created by 汤天明 on 2018/9/18.
//  Copyright © 2018年 汤天明. All rights reserved.
//

#import "TeachSet.h"

@implementation TeachSet

- (BOOL)addMember:(Member *)member {
    return YES;
}

- (NSArray<Member *> *)currentMembers {
    return [NSArray array];
}

- (instancetype)initWithName:(NSString *)name members:(NSArray<Member *> *)members {
    if (self = [super init])
    {
        _name = name;
    }
    return self;
}

+ (TeachSet *)teachSet {
    return [[TeachSet alloc]init];
}

- (void)initwithName:(NSString *)name members:(NSArray<Member *> *)members {
    
}




+ (BOOL)maxMemberCount{
    return YES;
}
@end
