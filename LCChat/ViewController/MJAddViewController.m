//
//  MJAddViewController.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/11.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJAddViewController.h"

@interface MJAddViewController ()
@property (weak, nonatomic) IBOutlet UILabel *errorText;

@end

@implementation MJAddViewController


-(UIButton *)returnButton{
    if (!_returnButton) {
        _returnButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _returnButton.frame=CGRectMake(0, 65, 45, 40);
        [_returnButton setTitle:@"返回" forState:UIControlStateNormal];
    }
    return _returnButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.returnButton addTarget:self action:@selector(clickReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.returnButton];
}

-(void)clickReturn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)addFriend:(id)sender {
    //查询添加好友
    NSString *name=self.nameText.text;
    AVQuery *query=[AVQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:name];
    NSArray *arr=[query findObjects];
    if (arr.count>0) {
        AVUser *user=arr[0];
        AVUser *selfUser=[AVUser currentUser];
        if (user.username==selfUser.username) {
            self.errorText.text=@"不能添加自已";
        }
        
        //块发送消息
        self.userBlock(user);
        
        AVUser *mySelfUser=[AVUser currentUser];
        AVObject *friend=[[AVObject alloc] initWithClassName:[NSString stringWithFormat:@"friuserOf%@",mySelfUser.username]];
        [friend setObject:user forKey:[NSString stringWithFormat:@"%@",user.username]];
        [friend saveInBackground];
        
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    else{
        self.errorText.text=@"查无此人";
        return;
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
