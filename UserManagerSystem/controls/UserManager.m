

#import "UserManager.h"
#import "User.h"
#import "UserMenu.h"
#import "UserConllection.h"
#include <string.h>
@implementation UserManager
{
    NSMutableArray * users;
}
-(instancetype)initWithUser:(User *) u andUsers:(NSMutableArray *)us
{
    self = [super init];
    if (self) {
        self.user  = u;
        users = us;
    }
    return self;
}

-(void) userStart
{
    
    while (1) {
        [UserMenu showUserMainMenu:_user];
        int num;
        scanf("%d",&num);
        switch (num) {
            case 1:
                [self showInfo];
                break;
            case 2:
                [self modifyPassword];
                break;
            case 3:
                if(_user.power == 0)
                {
                    [UserConllection remarkUsers:users];
                    NSLog(@"❤️谢谢使用本系统❤️");
                    exit(0);
                }
                else
                {
                    return;
                }
            default:
                NSLog(@"输入编号有误，请重新输入~~~");
                break;
        }
    }
}
-(void) showInfo
{
    NSLog(@"✨您的信息如下：✨");
    NSLog(@"用户名：%@", _user.name);
    NSLog(@"密码：%@", _user.password);
    NSLog(@"权限: %@", _user.power==1?@"管理员":@"普通用户");
    NSLog(@"❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀❀");
}
-(BOOL) modifyPassword
{
    BOOL flg =NO;//修改不成功
    char p[50];
    NSLog(@"请输入原密码：");
    rewind(stdin);
    gets(p);
    NSString * oldPwd = [NSString stringWithUTF8String:p];
    if (oldPwd != _user.password) {
        NSLog(@"⚠️原密码错误~~~⚠️");
        return NO;
    }
    while (1) {
        NSLog(@"请输入新密码：");
        rewind(stdin);
        gets(p);
        NSLog(@"请再次输入新密码：");
        char pp[50];
        rewind(stdin);
        gets(pp);
        if(strcmp(pp, p)!=0)
        {
            NSLog(@"两次密码不一致，请重新输入");
            continue;
        }
        break;
    }
    _user.password = [NSString stringWithUTF8String:p];
    flg =YES;
    NSLog(@"密码修改成功👌");
    //修改后备份记录
    [UserConllection remarkUsers:users];
    return flg;
}
@end
