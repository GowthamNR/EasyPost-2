//
//  selectBackPhotoViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/13/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "EasyPost_Service.h"

@interface selectBackPhotoViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,EZPostService>
- (IBAction)selectImageBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageVwBack;
@property (weak, nonatomic) IBOutlet UIButton *btnDone;
- (IBAction)btnDoneForBackImage:(id)sender;
- (IBAction)btnSkip:(id)sender;

@end
