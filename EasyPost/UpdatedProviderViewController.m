//
//  UpdatedProviderViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/15/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "UpdatedProviderViewController.h"

@interface UpdatedProviderViewController ()

@end

@implementation UpdatedProviderViewController

- (void)viewDidLoad {
    self.lblProviderAtupdateScrn.text=[NSString stringWithFormat:@"%@",self.providersFromEditDetails.ProviderName];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btngotoCustProviders:(id)sender {
    
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
