//
//  SignUpViewController.h
//  EasyPost
//
//  Created by Bifortis on 3/19/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyPost_Service.h"
#import "SMSScrnAfterSignUpViewController.h"


@interface SignUpViewController : UIViewController<EZPostService,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtFullName;

@property (weak, nonatomic) IBOutlet UITextField *txtEmailID;
- (IBAction)btnDoneAtSignUpScrn:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (weak, nonatomic) IBOutlet UITextField *txtRetypePassword;




@property (weak, nonatomic) IBOutlet UITextField *txtTelephone;
@property (weak, nonatomic) IBOutlet UITextField *txtMobileNumber;
@property (weak,nonatomic) NSString *VerificationCode;


@property (weak, nonatomic) IBOutlet UITextField *txtLastName;


@end
