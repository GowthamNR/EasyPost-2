//
//  TandCViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/9/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyPost_Service.h"
@interface TandCViewController : UIViewController<EZPostService>
@property (weak, nonatomic) IBOutlet UITextView *txtVwAtTandCOfAboutUs;

@end
