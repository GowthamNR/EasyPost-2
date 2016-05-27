//
//  myProfileViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/7/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyPost_Service.h"
@interface myProfileViewController : UIViewController<EZPostService,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *lblNameAtProfile;
@property (weak, nonatomic) IBOutlet UITextField *lblIdAtProfile;
@property (weak, nonatomic) IBOutlet UITextField *lblEmail;
@property (weak, nonatomic) IBOutlet UITextField *LastName;

@property (weak, nonatomic) IBOutlet UITextField *lblPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *lblMobileNumber;
@property (weak, nonatomic) IBOutlet UITextView *adressTextView;
@property (weak, nonatomic) IBOutlet UIImageView *ImageFront;
@property (weak, nonatomic) IBOutlet UIImageView *ImageBack;
@property (weak, nonatomic) IBOutlet UIImageView *SignatureImage;

@end
