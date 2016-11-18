//
//  MJMeViewController.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/8.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJMeViewController.h"
#import "ChatKit/LCChatKit.h"
#import "MJLoginViewController.h"
#import "MJAddViewController.h"

@interface MJMeViewController ()

@end

@implementation MJMeViewController

-(UIButton *)addFriendButton{
    if (!_addFriendButton) {
        _addFriendButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _addFriendButton.frame=CGRectMake(view_Width-70, 60, 65, 34);
        [_addFriendButton setTitle:@"好友添加" forState:UIControlStateNormal];
        [_addFriendButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return  _addFriendButton;
}


-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, view_Width, view_height)];
       
    }
    return _headImageView;
}

-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0.5*view_Width, view_height*0.6, 80, 80)];
        _iconImageView.center=CGPointMake(view_Width/2, view_height*0.6);
        _iconImageView.layer.borderWidth=2;
        
    }
    return _iconImageView;
}

-(UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, view_height*75, view_Width, 40)];
        [_textLabel setNumberOfLines:0];
        [_textLabel setTextColor:[UIColor blueColor]];
        [_textLabel setFont:[UIFont systemFontOfSize:17]];
    }
    return _textLabel;
}

-(UIButton *)chatButton{
    if (!_chatButton) {
        _chatButton=[[UIButton alloc]initWithFrame:CGRectMake(50, view_height*0.8, 70, 45)];
        [_chatButton setTitle:@"聊聊" forState:UIControlStateNormal];
        [_chatButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_chatButton setTitleShadowColor:RGB(0, 201, 87) forState:UIControlStateNormal];
        
    }
    return _chatButton;
}
-(UIButton *)goodButton{
    if (!_goodButton) {
        _goodButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _goodButton.frame=CGRectMake(220, view_height*0.8, 70, 45);
        [_goodButton setTintColor:[UIColor brownColor]];
        [_goodButton setTitle:@"点赞" forState:UIControlStateNormal];
        [_goodButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _goodButton;
}

-(UIButton *)removeButton{
    if (!_removeButton) {
        _removeButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _removeButton.frame=CGRectMake(view_Width-150, 60, 65, 35);
        [_removeButton setTitle:@"切换帐号" forState:UIControlStateNormal];
        [_removeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _removeButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.headImageView setImage:[UIImage imageNamed:@"bgMe.jpg"]];
    [self.view addSubview:self.headImageView];
    [self.iconImageView setImage:[UIImage imageNamed:@"icon.jpeg"]];
    self.iconImageView.layer.cornerRadius=self.iconImageView.bounds.size.width/2;
    self.iconImageView.layer.masksToBounds=YES;
    [self.view addSubview:self.iconImageView];
    [self.textLabel setText:@"说点什么吧"];
    [self.view addSubview:self.textLabel];
    [self.chatButton addTarget:self action:@selector(openChat:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.chatButton];
    [self.goodButton addTarget:self action:@selector(addGood:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.goodButton];
    [self.addFriendButton addTarget:self action:@selector(addFriendClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addFriendButton];
    [self.removeButton addTarget:self action:@selector(clickRemove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.removeButton];
}


-(void)addFriendClick:(UIButton *)button{
    MJAddViewController *addVC=[[MJAddViewController alloc] init];
    [self presentViewController:addVC animated:YES completion:nil];
    }


-(void)openChat:(UIButton *)button{
    NSLog(@"xxx");
    LCCKConversationViewController *conversationViewController = [[LCCKConversationViewController alloc] initWithPeerId:@"568213373"];
    [self presentViewController:conversationViewController animated:YES completion:nil];
    
}

-(void)clickRemove:(id)sender{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    [def removeObjectForKey:@"userId"];
    [def removeObjectForKey:@"pswd"];
    MJLoginViewController *logVC=[[MJLoginViewController alloc] init];
    [self presentViewController:logVC animated:YES completion:nil];
    
    
}

-(void)addGood:(UIButton *)button{
    NSLog(@"zzzz");
        
    
    
    
    
    
    
    
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
