//
//  MJTabBarController.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/4.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJTabBarController.h"
#import "ChatKit/LCChatKit.h"
#import "MJTabBar.h"
#import "AppDelegate.h"
#import "MJLoginViewController.h"
@interface MJTabBarController ()
@property(nonatomic,strong)NSMutableArray *arrControllers;

@end

@implementation MJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MJTabBar *tabBar=[[MJTabBar alloc] initWithFrame:CGRectMake(0, 0, view_Width, 49)];
    [self.tabBar addSubview:tabBar];
    [self configController];
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    if (![def objectForKey:@"userId"]) {
        MJLoginViewController *logVC=[[MJLoginViewController alloc] init];
        [self presentViewController:logVC animated:YES completion:nil];
    }
        
    
    }

-(void)viewWillLayoutSubviews{
    
}

-(void)configController{
    
    
    
    
    
    
/*
    
    LCCKConversationListViewController *firstController=[[LCCKConversationListViewController alloc]init];
    [firstController.tabBarItem setBadgeColor:[UIColor blueColor]];
    UINavigationController *navFirst=[[UINavigationController alloc] initWithRootViewController:firstController];
    
    [_arrControllers addObject:navFirst];
    
    ViewController *vc=[[ViewController alloc]init];
    [vc.tabBarItem setBadgeColor:[UIColor redColor]];
    
    UINavigationController *NavVc=[[UINavigationController alloc] initWithRootViewController:vc];
    [_arrControllers addObject:NavVc];
    self.viewControllers=self.arrControllers;
*/
    
}
-(NSMutableArray *)arrControllers{
    if (!_arrControllers) {
        _arrControllers=[NSMutableArray arrayWithCapacity:0];
    }
    return _arrControllers;
}

@end
