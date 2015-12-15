//
//  Person.m
//  ocproject
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "User.h"

@implementation User

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.id forKey:@"id"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeInt:self.power forKey:@"power"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.id = [aDecoder decodeIntForKey:@"id"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.power = [aDecoder decodeIntForKey:@"power"];
    }
    return self;
}

@end
