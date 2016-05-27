//
//  SelectedProviderAfterAddViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/8/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "SelectedProviderAfterAddViewController.h"

@interface SelectedProviderAfterAddViewController ()

@end

@implementation SelectedProviderAfterAddViewController

- (void)viewDidLoad {
   
    
    self.lblProviderList.text=[NSString stringWithFormat:@"%@",self.SelectedProviderModel.Name];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addButton:(id)sender {

    EasyPost_Service *service=[[EasyPost_Service alloc] init];
    service.delegate=self;
    
    [service AddProviderToMyProviders:[[NSUserDefaults standardUserDefaults]valueForKey:@"Token"] catogory:self.SelectedProviderModel.CategoryID ProviderId:self.SelectedProviderModel.ProviderID];
}

-(void)addMyProvidersSuccess:(NSDictionary *)dict
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:[dict valueForKey:@"msg"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

-(void)addMyProvidersFailure:(NSDictionary *)dict
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:[dict valueForKey:@"errors"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
