//
//  TermsAndCondAfterLoginViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/27/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "TermsAndCondAfterLoginViewController.h"

@interface TermsAndCondAfterLoginViewController ()

@end

@implementation TermsAndCondAfterLoginViewController

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
    self.termsTxtVwAtTAndCAfterLogin.text=[Terms valueForKey:@"Text"];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[Terms valueForKey:@"Version_Id"] forKey:@"Version_Id"];
}

-(void)FetchTAndCFailure:(NSString *)ErrorForFailure
{
    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Error" message:ErrorForFailure delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alrt show];
}







-(void)AcceptTAndCSuccess
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Accepted new Terms and Conditions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
-(void)AcceptTAndCFailure
{
    NSLog(@"Failed to AcceptTAndCFailure at termsAndConditionsVwctrlAFTERLOGIN");
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

- (IBAction)btnChecked:(id)sender {
    if (self.Flag==false) {
        [self.btnCheckBox setImage:[UIImage imageNamed:@"checkboxclicked.png"] forState:UIControlStateNormal];
        self.Flag=true;
    }
    else
    {
        [self.btnCheckBox setImage:[UIImage imageNamed:@"checkBox@2x.png"] forState:UIControlStateNormal];
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

- (IBAction)btnContinue:(id)sender {
    if (self.Flag==true)
    {
        [self performSegueWithIdentifier:@"HomeScrnFromNewT&C" sender:self];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Please agree to the new terms and conditions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }

}
@end
