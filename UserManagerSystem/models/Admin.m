//
//  Admin.m
//  ocproject
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "Admin.h"
#import "User.h"
@implementation Admin

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.email forKey:@"email"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    User * p = [super initWithCoder:aDecoder];
    self = [super init];
    if (self) {
        self.id = p.id;
        self.name = p.name;
        self.power = p.power;
        self.email = [aDecoder decodeObjectForKey:@"email"];
    }
    return self;
    
}

@end
