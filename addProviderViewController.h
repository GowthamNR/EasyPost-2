//
//  addProviderViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/2/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryList.h"
#import "EasyPost_Service.h"
#import "CategoryList.h"

@interface addProviderViewController : UIViewController<EZPostService,UIActionSheetDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtNameAtCreateProvider;

@property (weak, nonatomic) IBOutlet UITextField *txtDescriptionatCreateProvider;

@property (weak, nonatomic) IBOutlet UITextField *txtEmailofProvider;

@property (weak, nonatomic) IBOutlet UITextField *txtMobileNumberofProvider;

- (IBAction)btnCreateProvider:(id)sender;

@property (strong,nonatomic) NSString * categoryId;
@property (strong,nonatomic) NSMutableArray *Categories;
@property(nonatomic,strong)CategoryList *ModelObjc;
@property (weak, nonatomic) IBOutlet UITextField *txtFaxNumber;

- (IBAction)selectCategory:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *SelectCategorybtn;

@end
