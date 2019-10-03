//
//  LBRecommentCategor.m
//  LBbaisibudejie
//
//  Created by mc on 2019/9/30.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LBRecommentCategor.h"

@implementation LBRecommentCategor

-(NSMutableArray *)users{
    if(_users == nil){
        _users = [NSMutableArray array];
    }
    return _users;
}

+(id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    if([propertyName isEqualToString:@"ID"]){
        return @"id";
    }
    return propertyName;
    
}

@end
