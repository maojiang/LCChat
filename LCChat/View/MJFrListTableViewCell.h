//
//  MJFrListTableViewCell.h
//  LCChat
//
//  Created by 邓茂江 on 16/11/14.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVOSCloud/AVUser.h"
@interface MJFrListTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)AVUser *friUser;
-(void)configureCell:(AVUser *)user;
@end
