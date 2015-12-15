//
//  Person.h
//  ocproject
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>

@property(assign,nonatomic) unsigned int id;//编号
@property(nonatomic) NSString* name;//用户名
@property(nonatomic) NSString* password;//密码
@property(assign,nonatomic) unsigned int power;//权限编号 1管理员  2普通用户


@end
