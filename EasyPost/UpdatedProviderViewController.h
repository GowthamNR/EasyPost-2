//
//  UpdatedProviderViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/15/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Providers.h"

@interface UpdatedProviderViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblProviderAtupdateScrn;
@property(strong,nonatomic)Providers *providersFromEditDetails;
@end
