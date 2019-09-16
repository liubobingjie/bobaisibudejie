//
//  UIBarButtonItem+BoExtension.h
//  baisibobo
//
//  Created by mc on 2017/10/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BoExtension)
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString*)highImage target:(id)target action:(SEL)action;
@end
