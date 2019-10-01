//
//  LBRecommentCategor.h
//  LBbaisibudejie
//
//  Created by mc on 2019/9/30.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBRecommentCategor : NSObject

@property (nonatomic, strong)NSString *id;

@property (nonatomic, strong)NSString *name;

@property (nonatomic, strong)NSString *count;

/**辅助 保存这个类别对应的用户数据*/
@property(nonatomic, strong)NSMutableArray *users;

@property (nonatomic,assign) NSInteger total_page;
@property (nonatomic,assign) NSInteger total;

@property (nonatomic,assign) NSInteger currentPage;





@end

NS_ASSUME_NONNULL_END
