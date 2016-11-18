//
//  MJAddViewController.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/11.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJAddViewController.h"

@interface MJAddViewController ()
@property (nonatomic,strong)NSMutableArray *queryArr;
@end

@implementation MJAddViewController
-(NSMutableArray *)queryArr{
    if (!_queryArr) {
        _queryArr=[NSMutableArray array];
    }
   return _queryArr;
}

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
    NSString *name=self.nameText.text;
    AVQuery *query=[AVQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:name];
    NSArray *arr=[query findObjects];
    AVUser *user=arr[0];
    if (self.userBlock) {
        self.userBlock(user);
        [self dismissViewControllerAnimated:YES completion:nil];

    }else{
        NSLog(@"pass value fail");
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
