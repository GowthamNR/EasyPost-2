//
//  mainWithbuttonsViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/24/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "mainWithbuttonsViewController.h"

@interface mainWithbuttonsViewController ()

@end

@implementation mainWithbuttonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)notifyProvider:(id)sender {
    
    [self performSegueWithIdentifier:@"updateDetails" sender:self];
    
}

- (IBAction)btnMyProvider:(id)sender {
    [self performSegueWithIdentifier:@"ProvidersList" sender:self];
}

- (IBAction)btnUpdateProviderStatus:(id)sender {
    
    [self performSegueWithIdentifier:@"UpdateProvider" sender:self];
    
    
}



@end
