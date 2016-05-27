//
//  ModelForProvider.h
//  EasyPost
//
//  Created by Bifortis on 4/8/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelForProvider : NSObject
@property (strong,nonatomic) NSString *ProviderDesp;
@property (strong,nonatomic) NSString *EmailID;
@property (strong,nonatomic) NSString *Name;
@property (strong,nonatomic) NSString *MobileNum;
@property (strong,nonatomic) NSString *FaxNum;
@property (strong,nonatomic) NSString *CategoryID;
@property (strong,nonatomic) NSString *ProviderID;

- (instancetype)initWithDict:(NSString *)Name DespProvider:(NSString *)ProviderDesp Email:(NSString *)Email Mob:(NSString *)MobNum Fax:(NSString *)Fax CatergoryID:(NSString *)CategoryID ProviderID:(NSString *)ProviderID;
@end
