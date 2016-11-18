//
//  AppDelegate.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/4.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "AppDelegate.h"
#import <ChatKit/LCChatKit.h>
#import "MJTabBarController.h"
#import "MJUser.h"
#import <AVOSCloud/AVOSCloud.h>
@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [LCChatKit setAppId:@"b7fjrqyowrNcYMMLNBQg1SRj-gzGzoHsz" appKey:@"zUVEuyFjWCzIpaV8KlczeLTj"];
    [[LCChatKit sharedInstance] openWithClientId:@"568213372" callback:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            
        }
        else{
            NSLog(@"%@",error);
        }
        
    }];
    
    [AVOSCloud setApplicationId:@"b7fjrqyowrNcYMMLNBQg1SRj-gzGzoHsz" clientKey:@"zUVEuyFjWCzIpaV8KlczeLTj"];
    [AVAnalytics setAnalyticsEnabled:NO];
    [AVOSCloud setVerbosePolicy:kAVVerboseShow];
    [AVLogger addLoggerDomain:AVLoggerDomainIM];
    [AVLogger addLoggerDomain:AVLoggerDomainCURL];
    [AVLogger setLoggerLevelMask:AVLoggerLevelAll];
    
    
    [self configTabBarController];
    [[LCChatKit sharedInstance] setFetchProfilesBlock:^(NSArray<NSString *> *userIds, LCCKFetchProfilesCompletionHandler completionHandler) {
        
    }];
    

    [[LCChatKit sharedInstance] setFetchProfilesBlock:^(NSArray<NSString *> *userIds, LCCKFetchProfilesCompletionHandler completionHandler) {
        NSMutableArray<id<LCCKUserDelegate>> *userList = [NSMutableArray array];
        for (NSString *userId in userIds) {
            //MyUser is a subclass of AVUser, conforming to the LCCKUserDelegate protocol.
            
            AVQuery *query = [MJUser query];
            NSError *error = nil;
            MJUser *object = (MJUser *)[query getObjectWithId:userId error:&error];
            if (error == nil) {
                [userList addObject:object];
            } else {
                if (completionHandler) {
                    completionHandler(nil, error);
                    return;
                }
            }
        }
        if (completionHandler) {
            completionHandler(userList, nil);
        }
    }
     ];
    
    
    
    
    
    
    
    
    return YES;
}



-(void)configTabBarController{
        
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    //添加最近联系人列表
    LCCKConversationListViewController *firstController=[[LCCKConversationListViewController alloc]init];
    UINavigationController *firstNav=[[UINavigationController alloc] initWithRootViewController:firstController];
    //[firstNav.tabBarItem setTitle:@"最近联系人"];
    MJTabBarController *tabVC=[[MJTabBarController alloc] init];
    [tabVC addChildViewController:firstNav];
    //添加好友列表
    UIViewController *listVC=[[NSClassFromString(@"MJFriendListViewController") alloc] init];
    LCCKBaseNavigationController *baseNav=[[LCCKBaseNavigationController alloc]initWithRootViewController:listVC];
    [tabVC addChildViewController:baseNav];
    
    //自已主页
    UIViewController *meVC=[[NSClassFromString(@"MJMeViewController") alloc] init];
    LCCKBaseNavigationController *meNav=[[LCCKBaseNavigationController alloc]initWithRootViewController:meVC];
    //[meNav.tabBarItem setTitle:@"个人中心"];
    [tabVC addChildViewController:meNav];
    self.window.rootViewController=tabVC;
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
