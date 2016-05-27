//
//  ModelForProvider.m
//  EasyPost
//
//  Created by Bifortis on 4/8/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "ModelForProvider.h"

@implementation ModelForProvider

- (instancetype)initWithDict:(NSString *)Name DespProvider:(NSString *)ProviderDesp Email:(NSString *)Email Mob:(NSString *)MobNum Fax:(NSString *)Fax CatergoryID:(NSString *)CategoryID ProviderID:(NSString *)ProviderID
{
    self = [super init];
    if (self) {
        self.Name=Name;
        self.ProviderDesp=ProviderDesp;
        self.EmailID=Email;
        self.MobileNum=MobNum;
        self.FaxNum=Fax;
        self.CategoryID=CategoryID;
        self.ProviderID=ProviderID;
    }
    return self;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"Name=%@,DespProvider=%@,Email=%@,Mob=%@,Fax=%@,categoryId=%@,ProviderID=%@",self.Name,self.ProviderDesp,self.EmailID,self.MobileNum,self.FaxNum,self.CategoryID,self.ProviderID];
}
@end