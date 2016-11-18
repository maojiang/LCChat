//
//  MJUser.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/8.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJUser.h"
@interface MJUser()

@end

static  MJUser *currentUser;
@implementation MJUser


+(instancetype)shareInstance{
    if (!currentUser) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            currentUser=[[MJUser alloc]init];
        });
        
        
    }
    
    return currentUser;
}


+ (instancetype)userWithUserId:(NSString *)userId name:(NSString *)name avatarURL:(NSURL *)avatarURL clientId:(NSString *)clientId{
    MJUser *user=[[MJUser alloc] init];
    user.userId=userId;
    user.avatarURL=avatarURL;
    user.username=name;

    
    return user;
    
}


- (instancetype)userWithUserId:(NSString *)userId name:(NSString *)name avatarURL:(NSURL *)avatarURL clientId:(NSString *)clientId{
    self.userId=userId;
    self.avatarURL=avatarURL;
    self.username=name;
    return self;
}




@end
