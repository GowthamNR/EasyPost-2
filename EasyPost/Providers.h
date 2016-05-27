//
//  Providers.h
//  EasyPost
//
//  Created by Bifortis on 4/15/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Providers : NSObject
@property(strong,nonatomic)NSString *CategoryId;
@property(strong,nonatomic)NSString *Providerdesp;
@property(strong,nonatomic)NSString *Notes;
@property(strong,nonatomic)NSString *ProviderId;
@property(strong,nonatomic)NSString *ProviderName;
-(instancetype)initWithDict:(NSString *)ProviderName Desp:(NSString *)ProviderDesp Notes:(NSString *)Notes ProviderID:(NSString *)ProviderId CatergoryId:(NSString *)CatergoryId;
@end
