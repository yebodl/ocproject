//
//  LoginManager.h
//  ocproject
//
//  Created by qianfeng on 15/12/12.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginManager : NSObject

@property(retain,nonatomic) NSMutableArray * users;

-(instancetype)initWithUsers:(NSMutableArray *) us;
-(void) loginStart;
@end
