//
//  signUpAndLoginViewController.h
//  EasyPost
//
//  Created by Bifortis on 3/18/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signUpAndLoginViewController : UIViewController
- (IBAction)btnSignUpAtSignUpAndLoginScrn:(id)sender;

- (IBAction)btnLogInAtSignUpAndLoginScrn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnHelpAtLoginAndSignupVwCtrl;
- (IBAction)btnHelp:(id)sender;


@end
