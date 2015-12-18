//
//  AdminMenu.m
//  ocproject
//
//  Created by qianfeng on 15/12/1.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "AdminMenu.h"

@implementation AdminMenu

//管理员主菜单
+(void) showMainMenu
{
    NSLog(@"1===个人信息管理");
    NSLog(@"2===用户记录管理");
    NSLog(@"3===用户记录排序");
    NSLog(@"4===导入和导出");
    NSLog(@"5===退出系统");
    NSLog(@"请选择编号：");
}
//管理员的用户管理菜单
+(void) showUserManageMenu
{
    NSLog(@"1===添加用户");
    NSLog(@"2===删除用户");
    NSLog(@"3===修改用户");
    NSLog(@"4===查询用户");
    [self subMenu:5];
}
//管理员的用户查找菜单
+(void) showFindUserMenu
{
    NSLog(@"1===查看全部用户信息");
    NSLog(@"2===根据ID查找用户");
    NSLog(@"3===根据姓名查找用户");
    [self subMenu:4];
}
//管理员的用户排序菜单
+(void) showSortUserMenu
{
    NSLog(@"1===根据ID排序");
    NSLog(@"2===根据Name排序");
    [self subMenu:3];
}

//管理员的退出菜单
+(void) subMenu:(int) n
{
    NSLog(@"%d===返回上级菜单",n);
    NSLog(@"%d===退出程序",n+1);
    NSLog(@"请选择编号：");
}

@end
