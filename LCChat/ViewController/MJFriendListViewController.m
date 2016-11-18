//
//  MJFriendListViewController.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/14.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJFriendListViewController.h"
#import "MJFrListTableViewCell.h"
#import "MJAddViewController.h"
#import <ChatKit/LCChatKit.h>
@interface MJFriendListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *friendArray;
@property(nonatomic,strong)UIButton *addFriendButton;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MJFriendListViewController

-(NSMutableArray *)friendArray{
    if (!_friendArray) {
        _friendArray=[NSMutableArray arrayWithCapacity:0];
        AVUser *user=[AVUser currentUser];
        [_friendArray addObject:user];
    }
    return _friendArray;
}

-(UIButton *)addFriendButton{
    if (!_addFriendButton) {
        _addFriendButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _addFriendButton.frame=CGRectMake(self.view.bounds.size.width-60, 0, 60, 60);
        [_addFriendButton setTitle:@"添加" forState:UIControlStateNormal];
    }
    return _addFriendButton;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:80 green:25 blue:125 alpha:0.6]];
    [self.navigationItem setTitle:@"好友"];
    
    [self.addFriendButton addTarget:self action:@selector(addButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:self.addFriendButton];
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width , self.view.bounds.size.height-60) style:UITableViewStylePlain];
    [self.tableView registerClass:[MJFrListTableViewCell class] forCellReuseIdentifier:@"FriCell"];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];

    
}
-(void)addButton:(id)sender{
    MJAddViewController *addVC=[[MJAddViewController alloc] init];
    [self presentViewController:addVC animated:YES completion:nil];
    __weak typeof(self) weakSelf=self;
    addVC.userBlock=^(AVUser *user){
        [weakSelf.friendArray addObject:user];
        [weakSelf.tableView reloadData];
        NSLog(@"########%@",weakSelf.friendArray);
        
        
    };
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MJFrListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FriCell"];
    if (!cell) {
        cell=[[MJFrListTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"FriCell"];
    }
   // [cell configureCell:self.friendArray[indexPath.row]];
    [cell configureCell:self.friendArray[0]];
    
    
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return self.friendArray.count;
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
