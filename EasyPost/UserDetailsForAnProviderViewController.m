//
//  UserDetailsForAnProviderViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/15/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "UserDetailsForAnProviderViewController.h"

@interface UserDetailsForAnProviderViewController ()

@end

@implementation UserDetailsForAnProviderViewController

- (void)viewDidLoad {
    self.lblProvider.text=[NSString stringWithFormat:@"%@",self.providersAtUserDetails.ProviderName];
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

- (IBAction)btnEditUserDetails:(id)sender {
    
    
    
    [self performSegueWithIdentifier:@"EditUserDetails" sender:self];
}

- (IBAction)btnDeleteProvider:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
        if([segue.identifier isEqualToString:@"EditUserDetails"])
        {
            editUserDetailsViewController *editUser =segue.destinationViewController;
            editUser.providersFromUserDetails=self.providersAtUserDetails;

        }

}
@end
