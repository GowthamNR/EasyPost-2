//
//  TermsAndCondAfterLoginViewController.h
//  EasyPost
//
//  Created by Bifortis on 3/27/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyPost_Service.h"

@interface TermsAndCondAfterLoginViewController : UIViewController<EZPostService>



- (IBAction)btnChecked:(id)sender;
- (IBAction)btnContinue:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCheckBox;

@property (weak, nonatomic) IBOutlet UITextView *termsTxtVwAtTAndCAfterLogin;
@property(assign ,nonatomic) BOOL Flag;
@end
