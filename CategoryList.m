//
//  CategoryList.m
//  EasyPost
//
//  Created by Bifortis on 4/2/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "CategoryList.h"

@implementation CategoryList

- (instancetype)initWithDict:(NSString *)CategoryID Logo:(NSString *)logo Name:(NSString *)Name
{
    self = [super init];
    if (self) {
        self.Id=CategoryID;
        self.Logo=logo;
        self.Name=Name;
    }
    return self;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"CategoryId:%@,  Logo:%@,  Name:%@",self.Id,self.Logo,self.Name];
}
@end
