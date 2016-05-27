//
//  termsAndConditionsViewController.h
//  EasyPost
//
//  Created by Bifortis on 3/18/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyPost_Service.h"

@interface termsAndConditionsViewController : UIViewController<EZPostService>

@property (weak, nonatomic) IBOutlet UILabel *lblTermsAndConditions;
@property (weak, nonatomic) IBOutlet UITextView *textVwOfTermsAndConditions;
@property (weak, nonatomic) IBOutlet UIButton *btnIAgreeAtTermsAndConditions;
- (IBAction)btnIAgreeAtTermsAndConditionsScreen:(id)sender;
- (IBAction)btnCheckBoxTC:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCheckBoxRef;
@property(assign ,nonatomic) BOOL Flag;
@end
