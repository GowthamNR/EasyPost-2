//
//  HelperAndConstants.h
//  EasyPost
//
//  Created by Bifortis on 3/24/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EasyPost_Service.h"
#import "Reachability.h"
@interface HelperAndConstants : NSObject
-(UIImage *)getImage :(NSString *)imageName andIsUserDp:(BOOL) dp andUserId:(NSString*)UserId;
@end

