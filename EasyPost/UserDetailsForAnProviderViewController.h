//
//  UserDetailsForAnProviderViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/15/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Providers.h"
#import "editUserDetailsViewController.h"

@interface UserDetailsForAnProviderViewController : UIViewController
@property(strong,nonatomic)Providers *providersAtUserDetails;
@property (weak, nonatomic) IBOutlet UILabel *lblProvider;
- (IBAction)btnEditUserDetails:(id)sender;
- (IBAction)btnDeleteProvider:(id)sender;
@end
