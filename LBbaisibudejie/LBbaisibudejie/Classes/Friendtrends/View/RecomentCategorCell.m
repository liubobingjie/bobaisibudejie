//
//  RecomentCategorCell.m
//  LBbaisibudejie
//
//  Created by mc on 2019/9/30.
//  Copyright © 2019 mac. All rights reserved.
//

#import "RecomentCategorCell.h"
#import "LBRecommentCategor.h"

@interface RecomentCategorCell()
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;


@end
@implementation RecomentCategorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textLabel.font = [UIFont systemFontOfSize:12];
    self.backgroundColor = LBRGBColor(233,233,233);
    
}

- (void)setCategory:(LBRecommentCategor *)category{
    _category = category;
    self.textLabel.text = category.name;
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? LBRGBColor(219, 21, 26) : LBRGBColor(78, 78, 78);
    

    
}

@end
