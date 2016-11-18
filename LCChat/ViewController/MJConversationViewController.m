//
//  MJConversationViewController.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/15.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJConversationViewController.h"
#import "AVOSCloudIM.h"
@interface MJConversationViewController ()

@end

@implementation MJConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFetchConversationHandler:^(AVIMConversation *conversation, LCCKConversationViewController *conversationController) {
        if (!conversation) {
            NSLog(@"fail to open conversation");
        }
    }];
    UIButton *returnButton=[UIButton buttonWithType:UIButtonTypeSystem];
    returnButton.frame=CGRectMake(0, 0, 55 , 40);
    [returnButton setTitle:@"返回" forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController.navigationBar addSubview:returnButton];
    
  }

-(void)clickReturn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
