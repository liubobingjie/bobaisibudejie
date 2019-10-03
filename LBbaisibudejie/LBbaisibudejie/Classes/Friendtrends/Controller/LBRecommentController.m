//
//  LBRecommentController.m
//  LBbaisibudejie
//
//  Created by mc on 2019/9/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LBRecommentController.h"
#import "RecomentCategorCell.h"
#import "LBRecommentCategor.h"
#import "LBUserRecomentViewCell.h"
#import "LBRecommentUserModel.h"

#define SelectedCategor self.categories[self.categoryTable.indexPathForSelectedRow.row]


@interface LBRecommentController ()<UITableViewDelegate,UITableViewDataSource>
//类别数组
@property (weak, nonatomic) IBOutlet UITableView *categoryTable;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
@property (nonatomic,strong) NSArray * categories;

//保存请求参数
@property (nonatomic, strong) NSMutableDictionary *params;

//@property (nonatomic,strong) NSArray * userArray;
@end

static NSString *const userID = @"user";

@implementation LBRecommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
    self.view.backgroundColor = SystemGlobaBG;
    self.params = [NSMutableDictionary dictionary];
    self.categoryTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
     self.userTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
   // self.contentInsetAdjustmentBehavior = NO;
    
    self.userTableView.rowHeight = 70;
    self.userTableView.backgroundColor = SystemGlobaBG;
    
    [self.categoryTable registerNib:[UINib nibWithNibName:NSStringFromClass([RecomentCategorCell class]) bundle:nil] forCellReuseIdentifier:@"Categor"];
    
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LBUserRecomentViewCell class]) bundle:nil] forCellReuseIdentifier:userID];
    
    [self  setupRefresh];
    
    
    [self loadCategoryData];
    
}
//刷新控件
- (void)setupRefresh{
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
    
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footRefresh)];
    self.userTableView.mj_footer.hidden = YES;
    
    
}

- (void)headRefresh{
    
     LBRecommentCategor *cate =  self.categories[self.categoryTable.indexPathForSelectedRow.row];
    [SVProgressHUD show];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = cate.ID;
    
    self.params = params;
    [HttpTool getWithPath:nil params:params success:^(id json) {
        NSLog(@"%@",json);
        
        cate.currentPage = 1;
        NSArray *userArr = [LBRecommentUserModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        [cate.users removeAllObjects];
        [cate.users addObjectsFromArray:userArr];
        cate.total = [json[@"total"] integerValue];
        
        if(self.params != params){
            return ;
        }
        
        [self.userTableView reloadData];
        [SVProgressHUD dismiss];
         [self.userTableView.mj_header endRefreshing];
        if(cate.total == cate.users.count){
            [self.userTableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.userTableView.mj_footer endRefreshing];
        }
        
    } failure:^(NSError *error) {
        if(self.params != params) return ;
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
         [self.userTableView.mj_header endRefreshing];
        
    }];
    
}

-(void)footRefresh{
    
    LBRecommentCategor *cate = SelectedCategor;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = cate.ID;
    
    params[@"page"] =@(++cate.currentPage);
    
    if(cate.total == cate.users.count){
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
    [SVProgressHUD show];
    
    [HttpTool getWithPath:nil params:params success:^(id json) {
        NSArray *userArr = [LBRecommentUserModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        [cate.users addObjectsFromArray:userArr];
        [self.userTableView reloadData];
        [SVProgressHUD dismiss];
        if(cate.total == cate.users.count){
            [self.userTableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.userTableView.mj_footer endRefreshing];
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
         [self.userTableView.mj_footer endRefreshing];
         [SVProgressHUD dismiss];
        
    }];
    
}

- (void)loadCategoryData{
    
    [SVProgressHUD show];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    
    [HttpTool getWithPath:nil params:params success:^(id json) {
        //NSLog(@"%@",json);
        
        self.categories = [LBRecommentCategor mj_objectArrayWithKeyValuesArray:json[@"list"]];
        [self.categoryTable reloadData];
        
        [self.categoryTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        [self.userTableView.mj_header beginRefreshing];
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:@"请求失败"];
         [SVProgressHUD dismiss];
       
    }];
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.categoryTable){
         return self.categories.count;
    }else{
        
       LBRecommentCategor *c =  self.categories[self.categoryTable.indexPathForSelectedRow.row];
        
        self.userTableView.mj_footer.hidden = (c.users.count == 0);
        //判断底部刷新控件的文字
        if(c.total == c.users.count){
            [self.userTableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.userTableView.mj_footer endRefreshing];
        }
        return c.users.count;
    }
    
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == self.categoryTable){
        RecomentCategorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Categor"];
        cell.category = self.categories[indexPath.row];
        
        return cell;
    }else{
        LBUserRecomentViewCell * cell = [tableView dequeueReusableCellWithIdentifier:userID];
        
         LBRecommentCategor *c =  self.categories[self.categoryTable.indexPathForSelectedRow.row];
        cell.uerModel = c.users[indexPath.row];
     
        
        return cell;
    }
   
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if(tableView == self.userTableView){
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
        return;
    }
    
    
    LBRecommentCategor *cate = self.categories[indexPath.row];
    if(cate.users.count){
        [self.userTableView reloadData];
    }else{
        //马上显示当前的数据
        [self.userTableView reloadData];
        [self.userTableView.mj_header beginRefreshing];
       
        
    }
    

}








@end
