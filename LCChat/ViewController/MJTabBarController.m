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
    // 自定义tabbar
    MJTabBar *tabBar=[[MJTabBar alloc] initWithFrame:CGRectMake(0, 0, view_Width, 49)];
    [self.tabBar addSubview:tabBar];
    
    
    
    }

-(void)viewWillLayoutSubviews{
    
}



@end
