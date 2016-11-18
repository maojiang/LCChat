//
//  MJUser.h
//  LCChat
//
//  Created by 邓茂江 on 16/11/8.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVOSCloud/AVUser.h"
#import "ChatKit/LCCKUserDelegate.h"
@interface MJUser : AVUser


@property (nonatomic, copy, readwrite) NSString *clientId;
+(instancetype)shareInstance;
@end
