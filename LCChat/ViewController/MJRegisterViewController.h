//
//  MJRegisterViewController.h
//  LCChat
//
//  Created by 邓茂江 on 16/11/10.
//  Copyright © 2016年 maojiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJRegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userIdTextFied;
@property (weak, nonatomic) IBOutlet UITextField *pswdTextFied;
@property (weak, nonatomic) IBOutlet UITextField *niNameTextFied;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *telPhone;
@property (weak, nonatomic) IBOutlet UITextView *errorTipText;
@property (nonatomic,strong) UIButton *returnButton;
@end
