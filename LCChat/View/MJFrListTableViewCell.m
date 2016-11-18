//
//  MJFrListTableViewCell.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/14.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJFrListTableViewCell.h"

@implementation MJFrListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        [self.iconImageView setImage:[UIImage imageNamed:@"boy.jpeg"]];
        self.iconImageView.center=CGPointMake(30, self.bounds.size.height/2);
        [self addSubview:self.iconImageView];
        self.nameLabel=[[UILabel alloc] initWithFrame:CGRectMake(70, 10, 250, 30)];
        [self addSubview:self.nameLabel];

    }
    
    return self;
}

-(void)configureCell:(AVUser *)user{
    self.friUser=user;
    NSLog(@"%@",user);
    self.nameLabel.text=self.friUser.username;
    self.nameLabel.backgroundColor=[UIColor redColor];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
