//
//  MeViewController.m
//  LBbaisibudejie
//
//  Created by mc on 2019/9/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.view.backgroundColor = SystemGlobaBG;
    self.navigationItem.title = @"我的";
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

-(void)settingClick{
    
    
    
}

-(void)moonClick{
//    LoginViewController *vc = [[LoginViewController alloc]init];
//
//    [self presentViewController:vc animated:YES completion:nil];
    
    
    
}

@end
