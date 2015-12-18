//
//  CommonTool.m
//  UserManagerSystem
//
//  Created by alleastalleast on 15/12/16.
//  Copyright (c) 2015年 YB. All rights reserved.
//

#import "CommonTool.h"

@implementation CommonTool

/**
 *判断字符串是否是数字
 */
+(BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
@end
