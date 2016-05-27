//
//  SMSScrnAfterSignUpViewController.h
//  EasyPost
//
//  Created by Bifortis on 3/23/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUpViewController.h"
#import "EasyPost_Service.h"

@interface SMSScrnAfterSignUpViewController : UIViewController<UITextFieldDelegate,EZPostService>
@property (weak, nonatomic) IBOutlet UITextField *txtSmsCodeAtSMSScrnAfterSignUpScrn;

-(void)AssignVerificationCode:(NSString *)Code;

- (IBAction)btnDoneAtSMSScrnAfterSignUpScrn:(id)sender;

@property(strong,nonatomic) NSString *Recieved;
@end
