/*
 */

#import "UserConllection.h"
#define PATH @"/users/qianfeng/desktop/ocproject/1212users.plist"
@implementation UserConllection
//读取归档文件，获取所有用户信息
+(NSMutableArray *) loadUsers
{
    static NSMutableArray * users = nil;
    
    if (users == nil) {
        NSData * dd = [[NSData alloc] initWithContentsOfFile:PATH];
        NSKeyedUnarchiver *uarc = [[NSKeyedUnarchiver alloc] initForReadingWithData:dd];
        NSArray * rs = [uarc decodeObjectForKey:@"users"];
        users = [NSMutableArray arrayWithArray:rs];
    }
    return users;
}
//退出系统前，将数据归档
+(bool) remarkUsers:(NSMutableArray * )user
{
    NSMutableData * data = [[NSMutableData alloc] init];
    NSKeyedArchiver * arc = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [arc encodeObject:user forKey:@"users"];
    [arc finishEncoding];
    bool rs =[data writeToFile:PATH atomically:YES];
    return rs;
}

@end
