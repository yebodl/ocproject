//
//  UserConllection.h
//  UserManagerSystem
//
//  Created by qianfeng on 15/12/14.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import <Foundation/Foundation.h>
//
@interface UserConllection : NSObject


+(NSMutableArray *) loadUsers;
+(void) remarkUsers:(NSMutableArray * )user;

@end
