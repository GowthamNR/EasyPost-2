//
//  CategoryList.h
//  EasyPost
//
//  Created by Bifortis on 4/2/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryList : NSObject

@property (strong,nonatomic) NSString *Id;
@property (strong,nonatomic) NSString *Logo;
@property (strong,nonatomic) NSString *Name;

- (instancetype)initWithDict:(NSString *)CategoryID Logo:(NSString *)logo Name:(NSString *)Name;
@end
