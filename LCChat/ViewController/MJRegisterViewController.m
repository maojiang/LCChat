//
//  MJRegisterViewController.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/10.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJRegisterViewController.h"
#import "MJUser.h"
#import "ChatKit/LCChatKit.h"
@interface MJRegisterViewController ()

@end

@implementation MJRegisterViewController


-(UIButton *)returnButton{
    if (!_returnButton) {
        _returnButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _returnButton.frame=CGRectMake(0, 65, 45, 40);
        [_returnButton setTitle:@"返回" forState:UIControlStateNormal];
    }
    return _returnButton;
}

-(void)clickReturn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.returnButton addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.returnButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerUser:(id)sender {
    
    
    AVUser *user=[AVUser user];
    [user setObject:self.userIdTextFied.text forKey:@""];
    user.username=self.userIdTextFied.text;
    user.password=self.pswdTextFied.text;
    user.email=self.email.text;
    user.mobilePhoneNumber=self.telPhone.text;
    //user.clientId=self.userIdTextFied.text;
 __block   typeof(self) weakSelf=self;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"注册成功！！！");
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }
        weakSelf.errorTipText.text=[NSString stringWithFormat:@"%@",error];
        
    }];
       
    
    

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
