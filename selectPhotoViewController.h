//
//  selectPhotoViewController.h
//  EasyPost
//
//  Created by Bifortis on 3/23/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "EasyPost_Service.h"

@interface selectPhotoViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,EZPostService>

- (IBAction)SelectImageTapGesture:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageVwAtSelectPhotoScrn;

- (IBAction)btnSkip:(id)sender;
- (IBAction)BtnDoneAtSelectPhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnDoneRefAtSelectPhoto;

@end
