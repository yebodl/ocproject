//
//  UserManager.h
//  UserManagerSystem
//
//  Created by qianfeng on 15/12/14.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@interface UserManager : NSObject

@property(nonatomic) User * user;

-(instancetype)initWithUser:(User *) u andUsers:(NSMutableArray *)us;

-(void) userStart;
-(void) showInfo;
-(BOOL) modifyPassword;

@end
