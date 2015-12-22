//
//  AdminManager.m
//  UserManagerSystem
//
//  Created by qianfeng on 15/12/14.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "AdminManager.h"
#import "UserManager.h"
#import "AdminMenu.h"
#import "UserMenu.h"
#import "Admin.h"
#import "UserConllection.h"
#import "CommonTool.h"

@implementation AdminManager
-(instancetype)initWithUsers:(NSMutableArray *) us
                    andAdmin:(Admin *) admin
{
    self = [super init];
    if (self) {
        self.users = us;
        self.admin = admin;
    }
    return self;
}
-(void)AdminStart
{
    while (1) {
        NSLog(@"\n🍁🍁🍁🍁🍁欢迎管理员 %@  🍁🍁🍁🍁🍁🍁",_admin.name);
        [AdminMenu showMainMenu];
        int num;
        scanf("%d",&num);
        switch (num) {
            case 1:
            {
                [UserMenu showUserMainMenu:_admin];
                UserManager * um =[[UserManager alloc] initWithUser:_admin andUsers:_users];
                [um userStart];
                break;
            }
            case 2:
            {
                [self UserInfoManager];
                break;
            }
            case 4:
            {
                //TO-DO 导入导出
                NSLog(@"1--用户信息导出");
                NSLog(@"2--用户信息导入");
                int n;
                NSLog(@"请输入编号：");
                scanf("%d",&n);
                if (n==1) {
                   _users = [UserConllection loadUsers];
                    NSLog(@"用户信息加载成功");
                }
                else if(n==2){
                    [UserConllection remarkUsers:_users];
                    NSLog(@"用户信息保存成功");
                }
                else
                {
                    NSLog(@"编号输入有误");
                }
                break;
                
            }
            case 5:
            {
                [UserConllection remarkUsers:_users];
                NSLog(@"❤️谢谢使用本系统❤️");
                exit(0);
                break;
            }
            case 3:
            {
                [self UserInfoSort];
                break;
            }
            default:
                NSLog(@"输入编号有误，请重新输入~~~");
                break;
        }
    }
}

/**
 *用户信息排序
 */
-(void)UserInfoSort
{
    while (1) {
        [AdminMenu showSortUserMenu];
        int num;
        scanf("%d",&num);
        switch (num) {
            case 1:
                [self UserSortByID];
                [self showUserInfos:_users];
                break;
            case 2:
                [self UserSortByName];
                [self showUserInfos:_users];
                break;
            case 3:
                return;
                break;
            case 4:
            {
                [UserConllection remarkUsers:_users];
                NSLog(@"❤️谢谢使用本系统❤️");
                exit(0);
                break;
            }
            default:
                NSLog(@"输入编号有误，请重新输入~~~");
                break;
        }
    }
}

/**
 * 根据用户id排序
 **/
-(void)UserSortByID
{
    [_users sortUsingComparator:^NSComparisonResult(__strong id obj1,__strong id obj2){
        User *user1 = (User *)obj1;
        User *user2 = (User *)obj2;
        return user1.id > user2.id;
    }];
}

/**
 * 根据用户姓名排序
 **/
-(void)UserSortByName
{
    [_users sortUsingComparator:^NSComparisonResult(__strong id obj1,__strong id obj2){
        User *user1 = (User *)obj1;
        User *user2 = (User *)obj2;
        return [user1.name compare:user2.name] >0 ;
    }];
}

/**
 * 用户记录管理
 */
-(void)UserInfoManager
{
    while (1) {
        [AdminMenu showUserManageMenu];
        int num;
        scanf("%d",&num);
        switch (num) {
            case 1:
                [self AddUser];
                break;
            case 2:
                [self DeleteUser];
                break;
            case 3:
                [self UpdateUser];
                break;
            case 4:
                [self SelectUser];
                break;
            case 5:
                return;
                break;
            case 6:
            {
                [UserConllection remarkUsers:_users];
                NSLog(@"❤️谢谢使用本系统❤️");
                exit(0);
                break;
            }
            default:
                NSLog(@"输入编号有误，请重新输入~~~");
                break;
        }
    }
}
/**
 * 用户名是否存在
 */
-(int) isExistWithName:(NSString *) name
{
    int nIndex = -1;
    
    for (int i=0; i<[_users count]; i++) {
        User *user = _users[i];
        if (user.name == name) {
            nIndex = i;
            break;
        }
    }
    return nIndex;
}

-(int)isExistWithId:(int) uid
{
    int nIndex = -1;
    
    for (int i=0; i<[_users count]; i++) {
        User *user = _users[i];
        if (user.id == uid) {
            nIndex = i;
            break;
        }
    }
    return nIndex;
}

/**
 *添加用户
 */
-(void) AddUser
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
   if( [self isExistWithName:uname]!=-1)
   {
       NSLog(@"😢%@用户名已存在，无法添加😢", uname);
       return;
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
    //user.id = (int)[self.users count] + 1;
    user.id = arc4random() % 9000+1000;
    [_users addObject:user];
    
    NSLog(@"\n✅追加成功✅");
    
    //追加后归档
    [UserConllection remarkUsers:_users];
}

/**
 *删除用户
 */
-(void) DeleteUser
{
    int uid = [self GetID];
    int nIndex = -1;
    
    for (int i=0; i<[_users count]; i++) {
        User *user = _users[i];
        if (user.id == uid) {
            nIndex = i;
            break;
        }
    }
    if (nIndex == -1) {
        NSLog(@"\n没有此用户");
        return;
    }
    User *user = _users[nIndex];
    NSLog(@"你确认要删除编号：%d  用户名：%@的用户信息？",
          user.id, user.name);
    NSLog(@"1-是   2-否");
    int num ;
    scanf("%d",&num);
    if (num==2) {
        NSLog(@"⏪撤销删除操作⏪");
        return;
    }
    
    [_users removeObjectAtIndex:nIndex];
    NSLog(@"\n✅删除成功✅");
    
    //删除后归档
    [UserConllection remarkUsers:_users];
}

/**
 *修改用户
 */
-(void) UpdateUser
{
    int uid = [self GetID];
    
    int nIndex = -1;
    
    for (int i=0; i<[_users count]; i++) {
        User *user = _users[i];
        if (user.id == uid) {
            nIndex = i;
            break;
        }
    }
    if (nIndex == -1) {
        NSLog(@"\n没有此用户");
        return;
    }
    NSLog(@"请输入密码:");
    char n[100];
    rewind(stdin);
    gets(n);
    NSString * pwd = [NSString stringWithUTF8String:n];
    while ([pwd length] == 0) {
        NSLog(@"密码不能为空");
        NSLog(@"请输入密码:");
        gets(n);
        pwd = [NSString stringWithUTF8String:n];
    }
    User *user = _users[nIndex];
    user.password =pwd;
    
    [_users replaceObjectAtIndex:nIndex withObject:user];
    
    NSLog(@"\n✅修改成功✅");
    
    //修改后归档
    [UserConllection remarkUsers:_users];
}

/**
 *查询用户
 */
-(void) SelectUser
{
    
    while (1) {
        [AdminMenu showFindUserMenu];
        int num;
        scanf("%d",&num);
        
        switch (num) {
            case 1:
            {
                //查看全部用户信息
                [self showUserInfos:_users];
                break;
            }
            case 2:
            {
                //根据ID查找用户
                int uNum = [self GetID];
                int nIndex = [self isExistWithId:uNum];
                if (nIndex==-1) {
                    NSLog(@"😭Id：%d用户不存在，请查确认后查询~~😭",uNum);
                    break;
                }
                [self showUserInfo:_users[nIndex]];
                break;
            }
            case 3:
            {
                //根据姓名查找用户
                NSLog(@"请输入用户名(支持模糊查询):");
                char n[100];
                rewind(stdin);
                gets(n);
                NSString * uname = [NSString stringWithUTF8String:n];
                while ([uname length] == 0) {
                    NSLog(@"用户名不能为空");
                    NSLog(@"请输入用户名(支持模糊查询):");
                    gets(n);
                    uname = [NSString stringWithUTF8String:n];
                }
                
                NSMutableArray *users = [self getUserByName:uname];
                if (users.count ==0) {
                    NSLog(@"🙈没有符合名字的用户信息~~🙈");
                    break;
                }
                [self showUserInfos:users];
                break;
            }
            case 4:
                return;
                break;
            case 5:
            {
                [UserConllection remarkUsers:_users];
                NSLog(@"❤️谢谢使用本系统❤️");
                exit(0);
                break;
            }
            default:
                NSLog(@"输入编号有误，请重新输入~~~");
                break;
        }
    }
}

/**
 *获取输入的ID
 */
-(int) GetID
{
    NSString *uid = @"";
    
    while ([uid length] == 0) {
        NSLog(@"请输入用户ID:");
        char i[100];
        rewind(stdin);
        gets(i);
        uid = [NSString stringWithUTF8String:i];
        if ([uid length] == 0) {
            NSLog(@"🈳用户ID不能为空🈳");
            continue;
        }
        
        if (![CommonTool isPureInt:uid]) {
            NSLog(@"🈲用户ID应该为数字🈲");
            uid = @"";
            continue;
        }
    }
    
    int uNum = [uid intValue];
    return uNum;
}

/**
 *根据姓名模糊查询用户
 */
-(NSMutableArray *) getUserByName: (NSString *) uname
{
    NSMutableArray *users = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[_users count]; i++) {
        User *user = _users[i];
        
        if ([user.name rangeOfString:uname].location !=NSNotFound) {
            [users addObject:user];
        }
    }
    
    return users;
}

/**
 *展示用户信息
 */
-(void) showUserInfo:(User *)user
{
    NSLog(@"\n✨信息如下：✨");
    NSLog(@"编号：%d", user.id);
    NSLog(@"用户名:%@", user.name);
    NSLog(@"密码:%@", user.password);
    NSLog(@"权限: %@", user.power==1?@"管理员":@"普通用户");
    NSLog(@"\n🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀");
}

/**
 *展示所有用户信息
 */
-(void) showUserInfos:(NSMutableArray *)users
{
    NSLog(@"\n✨信息如下：✨");
    NSLog(@"\n🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀");
    if ([users count] == 0) {
        NSLog(@"没有相关用户");
    }else{
        for (int i=0; i<[users count]; i++) {
            User *user = users[i];
           
            NSLog(@"\n❤️编号：%d\n💚用户名:%@\n💛密码:%@\n💜权限: %@",user.id, user.name,user.password,user.power==1?@"管理员":@"普通用户");
            NSLog(@"\n------------------");
        }
    }
    NSLog(@"\n🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀🌀");
}
@end
