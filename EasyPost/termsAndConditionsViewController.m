//
//  termsAndConditionsViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/18/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "termsAndConditionsViewController.h"

@interface termsAndConditionsViewController ()

@end

@implementation termsAndConditionsViewController

- (void)viewDidLoad {

    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
   [service GetTermsAndConditions];
    
    self.Flag=false;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)FetchTAndCSuccess:(NSDictionary *)ResponseForTAndC
{
    NSDictionary *Terms=[[NSDictionary alloc]initWithDictionary:[ResponseForTAndC valueForKey:@"t&c"]];

    self.textVwOfTermsAndConditions.text=[Terms valueForKey:@"Text"];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[Terms valueForKey:@"Version_Id"] forKey:@"Version_Id"];
    
}

-(void)FetchTAndCFailure:(NSString *)ErrorForFailure
{
    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Error" message:ErrorForFailure delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alrt show];

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

- (IBAction)btnIAgreeAtTermsAndConditionsScreen:(id)sender {
    if (self.Flag==true) {
    [self performSegueWithIdentifier:@"ToImageSelectionScrn" sender:self];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Please agree to terms and conditions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

- (IBAction)btnCheckBoxTC:(id)sender
{
    if (self.Flag==false) {
    [self.btnCheckBoxRef setImage:[UIImage imageNamed:@"checkboxclicked.png"] forState:UIControlStateNormal];
    self.Flag=true;
    }
    else
    {
       [self.btnCheckBoxRef setImage:[UIImage imageNamed:@"checkBox@2x.png"] forState:UIControlStateNormal];
        self.Flag=false;
    }
    if (self.Flag==true) {
        EasyPost_Service *service=[[EasyPost_Service alloc]init];
        service.delegate=self;
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
      
        NSString *token=[defaults valueForKey:@"Token"];
        NSString *VersionID=[defaults valueForKey:@"Version_Id"];
       
        [service AcceptTermsAndConditions:token VersionId:VersionID];
        
    }
    }

-(void)AcceptTAndCSuccess
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Accepted Terms and Conditions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

-(void)AcceptTAndCFailure
{
    NSLog(@"Failed to AcceptTAndCFailure at termsAndConditionsVwctrl");
}
@end
