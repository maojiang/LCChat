//
//  MJAddViewController.h
//  LCChat
//
//  Created by 邓茂江 on 16/11/11.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVOSCloud/AVQuery.h"
#import "MJUser.h"
//实现块传AVUser
typedef void(^returnUserBlock)(AVUser *user);

@interface MJAddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (nonatomic,strong)UIButton *returnButton;
@property (nonatomic,copy)returnUserBlock userBlock;
@end
