//
//  Admin.h
//  ocproject
//
//  Created by qianfeng on 15/11/30.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "User.h"

@interface Admin : User<NSCoding>

@property(nonatomic) NSString* email;//邮箱

@end
