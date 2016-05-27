//
//  signUpAndLoginViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/18/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "signUpAndLoginViewController.h"

@interface signUpAndLoginViewController ()

@end

@implementation signUpAndLoginViewController

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

- (IBAction)btnSignUpAtSignUpAndLoginScrn:(id)sender {
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:@"email" forKey:@"RegisterType"];

    [self performSegueWithIdentifier:@"ToSignUp" sender:self];
}

- (IBAction)btnLogInAtSignUpAndLoginScrn:(id)sender {
    
    [self performSegueWithIdentifier:@"SignInScrn" sender:self];
}
- (IBAction)btnHelp:(id)sender {
    
    
    
    
    
    
    
    
    
    
    
    
}
@end
