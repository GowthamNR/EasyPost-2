//
//  loginWithGmailAndFbViewController.h
//  EasyPost
//
//  Created by Bifortis on 3/18/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <GooglePlus/GooglePlus.h>
#import "EasyPost_Service.h"

@class GPPSignInButton;

@interface loginWithGmailAndFbViewController : UIViewController<UIGestureRecognizerDelegate,FBLoginViewDelegate,GPPSignInDelegate,EZPostService,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtUserName;

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (retain, nonatomic) IBOutlet GPPSignInButton *signInButton;

- (IBAction)btnForgotPassword:(id)sender;

- (IBAction)btnDone:(id)sender;

@end
