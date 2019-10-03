//
//  LBPushGuideView.m
//  LBbaisibudejie
//
//  Created by mc on 2019/10/1.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LBPushGuideView.h"

@implementation LBPushGuideView

+(instancetype) guideview{
    
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    
}
- (IBAction)close:(id)sender {
    [self removeFromSuperview];
}

@end
