//
//  LoginManager.m
//  ocproject
//
//  Created by qianfeng on 15/12/12.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "LoginManager.h"
#import "User.h"
#import "Admin.h"
#import "UserManager.h"
#import "AdminManager.h"
@implementation LoginManager

-(instancetype)initWithUsers:(NSMutableArray *) us
{
    self = [super init];
    if (self) {
        self.users = us;
    }
    return self;
}
//登录开始
-(void) loginStart
{
    NSLog(@"请输入用户名");
    char n[100];
    rewind(stdin);
    gets(n);
    NSString * uname = [NSString stringWithUTF8String:n];
    NSLog(@"请输入密码：");
    gets(n);
    NSString * upwd = [NSString stringWithUTF8String:n];
    
    for (int i=0; i<[_users count]; i++) {
        User * u = _users[i];
        //用户名和密码一致
        if([u.name isEqualToString:uname] && [u.password isEqualToString:upwd]){
            //判断身份 1 管理员  2 普通用户
            if (u.power ==1) {
                //进入管理员界面
                Admin * admin = _users[i];
                AdminManager * am = [[AdminManager alloc] initWithUsers:_users andAdmin:admin];
                [am AdminStart];
            }
            else
            {
                //进入普通用户界面
                UserManager * um =[[UserManager alloc] initWithUser:u andUsers:_users];
                [um userStart];
            }
            return;
        }
    }
    NSLog(@"\n🙅用户名或密码错误🙅");
    return;
}
@end
