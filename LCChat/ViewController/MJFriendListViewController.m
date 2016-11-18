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
#import "MJConversationViewController.h"
typedef void(^LCCKConversationsListDidSelectItemBlock)(NSIndexPath *indexPath, AVIMConversation *conversation, LCCKConversationListViewController *controller);


@interface MJFriendListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIButton *addFriendButton;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSString *filePath;
@property(nonatomic,strong)NSMutableArray *friList;
@end

@implementation MJFriendListViewController

//加载添加好友Button

-(UIButton *)addFriendButton{
    if (!_addFriendButton) {
        _addFriendButton=[UIButton buttonWithType:UIButtonTypeSystem];
        _addFriendButton.frame=CGRectMake(self.view.bounds.size.width-60, 0, 60, 60);
        [_addFriendButton setTitle:@"添加" forState:UIControlStateNormal];
    }
    return _addFriendButton;
}
//查询并取到好友的damo
-(AVUser *)queryUser:(NSString *)name{
    AVQuery *query=[AVQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:name];
    NSArray *arr=[query findObjects];
    if(arr.count==0){return 0;}
    AVUser *cuUser=arr[0];
    
    return cuUser;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //数组初始化不能为空，可加载一个客服号用568213372模拟客服。

    AVUser *user=[self queryUser:@"568213372"];
    
    NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    self.filePath=[path[0] stringByAppendingPathComponent:@"friendList.plist"];

    NSMutableDictionary *dic=[NSMutableDictionary dictionaryWithContentsOfFile:self.filePath];
    NSLog(@"&&&&#########%@",self.filePath);
    NSArray *fri=[dic allValues];
    self.friList = [NSMutableArray array];
    [self.friList addObject:user];
    [self.friList addObjectsFromArray:fri];
    
    //加载UI
    [self conigureUI];
    
    
}

//和云端比较好友，没有的拉下来加进本地，
-(void)compareWithCloudUser{
    AVUser *currentUser=[AVUser currentUser];
    AVQuery *query=[AVQuery queryWithClassName:[NSString stringWithFormat:@"friuserOf%@",currentUser.username]];
    NSArray *arrQuery=[query findObjects];
    AVObject *object=arrQuery[0];
    NSArray *arrLocation=[object allKeys];
 
        //1：遍历云端好友列表，
    for (NSInteger i=0; i<arrLocation.count; i++) {
        NSString *strName=arrLocation[i];
        //4：回头把flag设0重新比一次
        NSInteger flag=0;
        //2：遍历本地列表
        for (NSInteger j=0; j<self.friList.count; j++) {
            AVUser *friend=self.friList[j];
            //3：比较两表
            if (strName==friend.username) {
                flag+=1;
                
            }
        }
        //3：没发现相同则把云好友加入本地
        if (flag<=0) {
            AVUser *user=[self queryUser:strName];
            
            [self.friList addObject:user];
            
            [self saveFriendsList:user];
        }
    }

    
}


//本地保存好友列表
-(void)saveFriendsList:(AVUser *)friUser{
    __weak typeof(self) weakSelf=self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
                NSMutableDictionary *dic=[NSMutableDictionary dictionary];
        [dic setObject:friUser forKey:[NSString stringWithFormat:@"%@",friUser.username]];
        [dic writeToFile:weakSelf.filePath atomically:YES];
        
    });
    
}


//加载UI
-(void)conigureUI{
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

//数据不大,不用MJfresh刷新；

-(void)addButton:(id)sender{
    MJAddViewController *addVC=[[MJAddViewController alloc] init];
    [self presentViewController:addVC animated:YES completion:nil];
    __weak typeof(self) weakSelf=self;
    addVC.userBlock=^(AVUser *user){
        if (user) {
            [weakSelf saveFriendsList:user];
            [weakSelf compareWithCloudUser];
            
            [weakSelf.tableView reloadData];
           
            NSLog(@"********%@",weakSelf.friList);
        }
        
        
        
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


    
        [cell configureCell:self.friList[indexPath.row]];
    
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
        return self.friList.count;
    
}


//选中事件，传user过去；
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AVUser *user=self.friList[indexPath.row];
    
    MJConversationViewController *conversaionVC=[[MJConversationViewController alloc] initWithPeerId:user.username];
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:conversaionVC];
    
    [nav setTitle:[NSString stringWithFormat:@"与%@在聊天",user.username]];
   // LCCKConversationViewController *lcVC=[[LCCKConversationViewController alloc] initWithPeerId:user.username];
    //[lcVC.navigationController setTitle:[NSString stringWithFormat:@"与%@在聊天",user.username]];
   
    //conversaionVC.title=user.username;
    [self presentViewController:nav animated:YES completion:nil];
    
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
