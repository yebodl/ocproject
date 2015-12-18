//
//  UserMenu.m
//  ocproject
//
//  Created by qianfeng on 15/12/12.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "UserMenu.h"
#import "User.h"
@implementation UserMenu

+(void)showUserMainMenu:(User *)user
{
    NSLog(@"\n🌹欢迎 %@🌹",user.name);
    NSLog(@"1===查询个人信息");
    NSLog(@"2===修改密码");
    if(user.power ==0)
        NSLog(@"3===退出系统");
    else
        NSLog(@"3===返回上一层");
    NSLog(@"请选择编号：");
}
@end
