//
//  MJUser.h
//  LCChat
//
//  Created by 邓茂江 on 16/11/8.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVOSCloud/AVUser.h"
@interface MJUser : AVUser
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *pswd;
@property(nonatomic,strong)NSURL *avatarURL;
@property(nonatomic,strong)AVObject *object;
- (instancetype)userWithUserId:(NSString *)userId name:(NSString *)name avatarURL:(NSURL *)avatarURL clientId:(NSString *)clientId;
+(instancetype)shareInstance;
@end
