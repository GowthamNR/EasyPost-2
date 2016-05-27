//
//  editUserDetailsViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/15/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "editUserDetailsViewController.h"

@interface editUserDetailsViewController ()

@end

@implementation editUserDetailsViewController

- (void)viewDidLoad {
    
    self.lblProvider.text=[NSString stringWithFormat:@"%@",self.providersFromUserDetails.ProviderName];
    
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

- (IBAction)btnSave:(id)sender {
    
    [self performSegueWithIdentifier:@"UpdateScrn" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"UpdateScrn"])
    {
        UpdatedProviderViewController *updateScrn=segue.destinationViewController;
        updateScrn.providersFromEditDetails=self.providersFromUserDetails;
    }
 
}

@end
