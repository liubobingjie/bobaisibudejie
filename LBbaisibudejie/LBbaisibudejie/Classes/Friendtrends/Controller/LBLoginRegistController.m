//
//  LBLoginRegistController.m
//  LBbaisibudejie
//
//  Created by mc on 2019/10/1.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LBLoginRegistController.h"

@interface LBLoginRegistController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *PwdField;

@end

@implementation LBLoginRegistController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    self.PwdField.secureTextEntry = YES;
    
    
}
- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
   
}



@end
