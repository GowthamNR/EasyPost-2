//
//  EnterSMSViewController.h
//  EasyPost
//
//  Created by Bifortis on 3/18/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyPost_Service.h"
#import "Reachability.h"
#import "HelperAndConstants.h"

@interface EnterSMSViewController : UIViewController<UIGestureRecognizerDelegate,UITextFieldDelegate,EZPostService>

- (IBAction)btnDoneAtEnterSMSVwCtrl:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtEmailidAtForgotPassword;
@property (strong,nonatomic)Reachability *reachability;
@end
