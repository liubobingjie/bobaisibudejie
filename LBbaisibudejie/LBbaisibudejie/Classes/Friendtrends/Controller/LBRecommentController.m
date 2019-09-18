//
//  LBRecommentController.m
//  LBbaisibudejie
//
//  Created by mc on 2019/9/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LBRecommentController.h"

@interface LBRecommentController ()

@end

@implementation LBRecommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
    self.view.backgroundColor = SystemGlobaBG;
    [self loadCategoryData];
    
}
- (void)loadCategoryData{
    
    [SVProgressHUD show];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    
    [HttpTool getWithPath:nil params:params success:^(id json) {
        NSLog(@"%@",json);
        [SVProgressHUD dismiss];
        
    } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:@"请求失败"];
       
    }];
    
    
    
}



@end
