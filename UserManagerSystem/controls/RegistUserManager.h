//
//  RegistUserManager.h
//  UserManagerSystem
//
//  Created by qianfeng on 15/12/15.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegistUserManager : NSObject
@property(retain,nonatomic) NSMutableArray * users;
-(instancetype)initWithUsers:(NSMutableArray *) us;
-(void)registerUser;

@end
