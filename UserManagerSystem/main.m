//
//  main.m
//  UserManagerSystem
//
//  Created by qianfeng on 15/12/14.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserConllection.h"
#import "Menu.h"
#import "LoginManager.h"
#import "RegistUserManager.h"

int main(int argc, const char * argv[]) {
    //启动前 从归档文件中获取用户信息
    NSMutableArray * users = [UserConllection loadUsers];    while (1) {
        [Menu showLoginMenu];
        int num;
        scanf("%d",&num);
        switch (num) {	
            case 1:
            {
                LoginManager * lm = [[LoginManager alloc] initWithUsers:users];
                [lm loginStart];
            }
                break;
            case 2:
                //用户注册
            {
                RegistUserManager *rm = [[RegistUserManager alloc] initWithUsers:users];
                [rm registerUser];
            }
                break;
            case 3:
                NSLog(@"========================\n");
                NSLog(@"   O(∩_∩)O 谢谢使用本系统\n");
                NSLog(@"========================\n");
                exit(0);
                break;
            default:
                NSLog(@"编号输入错误，请重新输入");
                break;
        }
    }
    return 0;
}
