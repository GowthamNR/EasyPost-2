//
//  editUserDetailsViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/15/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDetailsForAnProviderViewController.h"
#import "UpdatedProviderViewController.h"

@interface editUserDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblProvider;
@property(strong,nonatomic)Providers *providersFromUserDetails;
- (IBAction)btnSave:(id)sender;
@end
