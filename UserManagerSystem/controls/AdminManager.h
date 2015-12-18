//
//  AdminManager.h
//  UserManagerSystem
//
//  Created by qianfeng on 15/12/14.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  Admin;
@interface AdminManager : NSObject

@property(retain,nonatomic) NSMutableArray * users;
@property(retain,nonatomic) Admin * admin;
-(instancetype)initWithUsers:(NSMutableArray *) us
                    andAdmin:(Admin *) admin;

-(void)AdminStart;
@end
