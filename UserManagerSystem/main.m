//
//  main.m
//  UserManagerSystem
//
//  Created by qianfeng on 15/12/14.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserConllection.h"
int main(int argc, const char * argv[]) {
    //启动前 从归档文件中获取用户信息
    NSMutableArray * users = [UserConllection loadUsers];
    NSLog(@"%lu",[users count]);
    return 0;
}
