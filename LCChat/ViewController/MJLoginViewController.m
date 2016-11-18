//
//  MJLoginViewController.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/9.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJLoginViewController.h"
#import "MJUser.h"
#import "MJRegisterViewController.h"
#import <ChatKit/LCChatKit.h>
@interface MJLoginViewController ()

@end

@implementation MJLoginViewController


//加载返回button；
-(UIButton *)returnButton{
    if (!_returnButton) {
        _returnButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _returnButton.frame=CGRectMake(0, 65, 45, 40);
        [_returnButton setTitle:@"返回" forState:UIControlStateNormal];
    }
    return _returnButton;
}

-(UITextField *)userTextField{
    if (!_userTextField) {
        _userTextField=[[UITextField alloc]initWithFrame:CGRectMake(view_Width/2-40, view_height/2, 100, 30)];
        [_userTextField setAdjustsFontSizeToFitWidth:YES];
        [_userTextField setBorderStyle:UITextBorderStyleBezel];
        
    }
    return _userTextField;
}

-(UITextField *)pawdTextField{
    if (!_pawdTextField) {
        _pawdTextField=[[UITextField alloc] initWithFrame:CGRectMake(view_Width/2-40, view_height/2+50, 100, 30)];
        [_pawdTextField setAdjustsFontSizeToFitWidth:YES];
        [_pawdTextField setBorderStyle:UITextBorderStyleBezel];
    }
    return _pawdTextField;
}

-(UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _loginButton.frame=CGRectMake(view_Width/2-30, view_height/2+100, 40, 30);
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        _loginButton.tag=100;
    }
    return _loginButton;
}

-(UIButton *)assettingButton{
    if (!_assettingButton) {
        _assettingButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _assettingButton.frame=CGRectMake(view_Width/2-80, view_height/2+100, 40, 30);
        [_assettingButton setTitle:@"注册" forState:UIControlStateNormal];
        _assettingButton.tag=200;
    }
    return _assettingButton;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    }


//配置UI将UI加到View上
-(void)configureUI{
    [self.loginButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.assettingButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(view_Width/2-113, view_height/2, 70, 30)];
    [label setText:@"用户名："];
    [self.view addSubview:label];
    
    UILabel *pswdLabel=[[UILabel alloc] initWithFrame:CGRectMake(view_Width/2-103, view_height/2+50, 60, 30)];
    [pswdLabel setText:@"密码："];
    [self.returnButton addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pswdLabel];
    [self.view addSubview:self.userTextField];
    [self.view addSubview:self.pawdTextField];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.assettingButton];
    [self.view addSubview:self.returnButton];
}

//选取时机将用户本地化
-(void)viewWillAppear:(BOOL)animated{
        NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    self.userTextField.text=[def objectForKey:@"userId"];
    self.pawdTextField.text=[def objectForKey:@"pswd"];
    
}

//返回上一viewcontroller
-(void)clickReturn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//点击登陆
-(void)clickButton:(UIButton *)button{
    
    
    if (button.tag==100) {
        [AVUser logOut];
    __block  AVUser *user=[AVUser user];
        user.username=self.userTextField.text;
        user.password=self.pawdTextField.text;
    __block    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
                [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                NSLog(@"login succeeded");
                [def setObject:user.username forKey:@"userId"];
                [def setObject:user.password forKey:@"pswd"];
                [[LCChatKit sharedInstance] openWithClientId:user.username callback:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        NSLog(@"############login succeeded");
                        
                        
                    }
                    else{
                        NSLog(@"%@",error);
                    }
                    
                }];

            }
            else{
                NSLog(@"login error==%@",error);
            }
        }];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    else{
        //跳转到注册
        MJRegisterViewController *regVC=[[MJRegisterViewController alloc] init];
        [self presentViewController:regVC animated:YES completion:nil];
        
    }
    
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
