//
//  UIBarButtonItem+BoExtension.m
//  baisibobo
//
//  Created by mc on 2017/10/30.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UIBarButtonItem+BoExtension.h"


@implementation UIBarButtonItem (BoExtension)
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    //CGSize size = button.currentBackgroundImage.size ;
    
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
    

}
@end
