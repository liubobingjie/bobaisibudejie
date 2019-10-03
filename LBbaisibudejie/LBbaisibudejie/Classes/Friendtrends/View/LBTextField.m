//
//  LBTextField.m
//  LBbaisibudejie
//
//  Created by mc on 2019/10/1.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LBTextField.h"

@implementation LBTextField

-(void)awakeFromNib{
    [super awakeFromNib];
    self.tintColor = [UIColor whiteColor];
//    unsigned int count = 0;
//
//   Ivar *ivar = class_copyIvarList([UITextField class], &count);
//
//    for (int i=0;i<count;i++){
//
//
//        NSLog(@"%s",ivar_getName(*(ivar + i)));
//    }
//    free(ivar);
//    UILabel *placeLable = [self valueForKey:@"_placeholderLabel"];
//    placeLable.textColor = [UIColor whiteColor];
    [self resignFirstResponder];
    
    
}


// Only override drawRect: if you perform custom drawing.

-(BOOL)becomeFirstResponder{
    UILabel *placeLable = [self valueForKey:@"_placeholderLabel"];
       placeLable.textColor = [UIColor whiteColor];
    
    return [super becomeFirstResponder];
    
}
-(BOOL)resignFirstResponder{
    UILabel *placeLable = [self valueForKey:@"_placeholderLabel"];
    placeLable.textColor = [UIColor grayColor];
    
    return [super resignFirstResponder];
}

//-(void)drawPlaceholderInRect:(CGRect)rect{
//
//    [self.placeholder drawInRect:rect withAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:self.font}];
//
//}


@end
