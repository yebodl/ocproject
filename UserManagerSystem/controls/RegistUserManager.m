//
//  RegistUserManager.m
//  UserManagerSystem
//
//  Created by qianfeng on 15/12/15.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "RegistUserManager.h"
#import "User.h"
#import "UserConllection.h"

@implementation RegistUserManager

-(instancetype)initWithUsers:(NSMutableArray *) us
{
    self = [super init];
    if (self) {
        self.users = us;
    }
    return self;
}

-(void)registerUser
{
    NSLog(@"请输入用户名:");
    char n[100];
    rewind(stdin);
    gets(n);
    NSString * uname = [NSString stringWithUTF8String:n];
    while ([uname length] == 0) {
        NSLog(@"用户名不能为空");
        NSLog(@"请输入用户名:");
        gets(n);
        uname = [NSString stringWithUTF8String:n];
    }
    
    NSLog(@"请输入密码:");
    gets(n);
    NSString * upwd = [NSString stringWithUTF8String:n];
    while ([upwd length] == 0) {
        NSLog(@"密码不能为空");
        NSLog(@"请输入密码:");
        gets(n);
        upwd = [NSString stringWithUTF8String:n];
    }
    User *user = [[User alloc] init];
    user.password = upwd;
    user.name = uname;
    user.power = 0;
    user.id = arc4random() % 9000+1000;
    
    
    [self.users addObject:user];
    NSLog(@"\n✅注册成功✅");
    NSLog(@"\n👌请用此账号登陆👌");
    return;
}

@end
