//
//  MJTabBar.m
//  LCChat
//
//  Created by 邓茂江 on 16/11/8.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import "MJTabBar.h"

@implementation MJTabBar
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UIButton *item=[UIButton buttonWithType:UIButtonTypeCustom];
        [item setTitle:@"最近联系人" forState:UIControlStateNormal];
        item.frame=CGRectMake(0, 0, self.bounds.size.width/3, 49);
        [item setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        //[item.titleLabel setFont:[UIFont fontWithName:@"ArialUnicodeMS" size:17]];
        [self addSubview:item];
        UIButton *item1=[UIButton buttonWithType:UIButtonTypeCustom];
        [item1 setTitle:@"好友列表" forState:UIControlStateNormal];
        item1.frame=CGRectMake(self.bounds.size.width/3, 0, self.bounds.size.width/3, 49);
        [item1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:item1];
        UIButton *item2=[UIButton buttonWithType:UIButtonTypeCustom];
        [item2 setTitle:@"个人中心" forState:UIControlStateNormal];
        item2.frame=CGRectMake(self.bounds.size.width*0.66, 0, self.bounds.size.width/3, 49);
        [item2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:item2];
        
        
    }
    
    return self;
}

@end
