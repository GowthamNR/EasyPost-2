//
//  UpdateDetails.h
//  EasyPost
//
//  Created by Bifortis on 4/16/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateDetails : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *EmailCheckboxBtn;
@property (weak, nonatomic) IBOutlet UIButton *AddressCheckBoxBtn;
@property (weak, nonatomic) IBOutlet UIButton *mobileCheckBoxbtn;
@property (weak, nonatomic) IBOutlet UIButton *PhoneCheckBoxBtn;
@property(assign ,nonatomic) BOOL Flag;
@end
