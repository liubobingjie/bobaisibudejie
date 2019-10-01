//
//  LBUserRecomentViewCell.m
//  LBbaisibudejie
//
//  Created by mc on 2019/9/30.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LBUserRecomentViewCell.h"


@interface LBUserRecomentViewCell()  
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation LBUserRecomentViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}

-(void)setUerModel:(LBRecommentUserModel *)uerModel{
    _uerModel = uerModel;
    self.screenName.text = _uerModel.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%@人",_uerModel.fans_count];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:uerModel.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
