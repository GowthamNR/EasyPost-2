//
//  SignatureViewController.h
//  EasyPost
//
//  Created by Bifortis on 3/23/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPSSignatureView.h"
#import "EasyPost_Service.h"
#import "HelperAndConstants.h"

@interface SignatureViewController : UIViewController<EZPostService,UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet PPSSignatureView *SignatureVw;

- (IBAction)btnReset:(id)sender;
- (IBAction)btnDone:(id)sender;
@end
