//
//  UserConllection.m
//  UserManagerSystem
//
//  Created by qianfeng on 15/12/14.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "UserConllection.h"

@implementation UserConllection
//读取归档文件，获取所有用户信息
+(NSMutableArray *) loadUsers
{
    static NSMutableArray * users = nil;
    
    if (users == nil) {
        NSData * dd = [[NSData alloc] initWithContentsOfFile:@"/users/qianfeng/ocproject/1212users.plist"];
        NSKeyedUnarchiver *uarc = [[NSKeyedUnarchiver alloc] initForReadingWithData:dd];
        users = [uarc decodeObjectForKey:@"users"];
    }
    return users;
}
//退出系统前，将数据归档
+(bool) remarkUsers:(NSMutableArray * )user
{
    NSMutableData * data = [[NSMutableData alloc] init];
    NSKeyedArchiver * arc = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [arc encodeObject:arr forKey:@"users"];
    [arc finishEncoding];
    bool rs =[data writeToFile:@"/users/qianfeng/ocproject/1212users.plist" atomically:YES];
    
}

@end
