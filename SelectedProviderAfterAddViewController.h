//
//  SelectedProviderAfterAddViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/8/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelForProvider.h"
#import "EasyPost_Service.h"
@interface SelectedProviderAfterAddViewController : UIViewController<EZPostService>


@property (weak, nonatomic) IBOutlet UILabel *lblProviderList;
@property (strong,nonatomic) ModelForProvider *SelectedProviderModel;
@end
