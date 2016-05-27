//
//  Providers.m
//  EasyPost
//
//  Created by Bifortis on 4/15/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "Providers.h"

@implementation Providers

-(instancetype)initWithDict:(NSString *)ProviderName Desp:(NSString *)ProviderDesp Notes:(NSString *)Notes ProviderID:(NSString *)ProviderId CatergoryId:(NSString *)CatergoryId
{
    self=[super init];
    if (self) {
                self.CategoryId=CatergoryId;
                self.Providerdesp=ProviderDesp;
                self.ProviderId=ProviderId;
                self.ProviderName=ProviderName;
                self.Notes=Notes;
            }
    return self;

}
-(NSString *)description
{
    return [NSString stringWithFormat:@"ProviderName=%@,ProviderId=%@,CatorgoryId=%@,ProviderDescription=%@,Providernotes=%@",self.ProviderName,self.ProviderId,self.CategoryId,self.Providerdesp,self.Notes];
}


@end
