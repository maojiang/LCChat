//
//  MJUser.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/8.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJUser.h"
@interface MJUser()<AVSubclassing,LCCKUserDelegate>

@end

static  MJUser *currentUser;
@implementation MJUser
@synthesize name;
@synthesize userId;
@synthesize avatarURL;
@synthesize clientId;


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.username forKey:@"usernameKey"];
    [aCoder encodeObject:self.password forKey:@"passswordKey"];
    [aCoder encodeObject:self.mobilePhoneNumber forKey:@"mobilePhoneNumberKey"];
    [aCoder encodeObject:self.email forKey:@"emailKey"];
    [aCoder encodeObject:self.clientId forKey:@"clientIdKey"];
    //[aCoder encodeObject:self.name forKey:@"nameKey"];
}

-(id)copyWithZone:(NSZone *)zone{
    MJUser *newUser=[[MJUser class] allocWithZone:zone];
    newUser.username=self.username;
    newUser.password=self.password;
    newUser.email=self.email;
    newUser.mobilePhoneNumber=self.mobilePhoneNumber;
    newUser.clientId=self.clientId;
    return self;
}
 

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super init];
    if (self) {
        self.username=[aDecoder decodeObjectForKey:@"usernameKey"];
        self.password=[aDecoder decodeObjectForKey:@"passswordKey"];
        self.email=[aDecoder decodeObjectForKey:@"emailKey"];
        self.mobilePhoneNumber=[aDecoder decodeObjectForKey:@"mobilePhoneNumberKey"];
        self.clientId=[aDecoder decodeObjectForKey:@"clientIdKey"];
        
    }
    
    return self;
}


- (instancetype)initWithUserId:(NSString *)userId name:(NSString *)name avatarURL:(NSURL *)avatarURL clientId:(NSString *)clientId{
    return self;
}
+ (instancetype)userWithUserId:(NSString *)userId name:(NSString *)name avatarURL:(NSURL *)avatarURL clientId:(NSString *)clientId{
    MJUser *user=[[MJUser alloc]init];
    return user;
}

+(instancetype)shareInstance{
    if (!currentUser) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            currentUser=[[MJUser alloc]init];
        });
        
        
    }
    
    return currentUser;
}








@end
