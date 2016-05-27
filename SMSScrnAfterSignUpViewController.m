//
//  SMSScrnAfterSignUpViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/23/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "SMSScrnAfterSignUpViewController.h"

@interface SMSScrnAfterSignUpViewController ()

@end

@implementation SMSScrnAfterSignUpViewController

- (void)viewDidLoad {
    
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    self.txtSmsCodeAtSMSScrnAfterSignUpScrn.text=[def valueForKey:@"SMSCode"];
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

- (IBAction)btnDoneAtSMSScrnAfterSignUpScrn:(id)sender {
    if (self.txtSmsCodeAtSMSScrnAfterSignUpScrn.text.length<=0) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter the code"delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        EasyPost_Service *service=[[EasyPost_Service alloc]init];
        [service VerifyToken:self.txtSmsCodeAtSMSScrnAfterSignUpScrn.text];
        service.delegate=self;
//        [self performSegueWithIdentifier:@"T&CScrnAfterRegister" sender:self];
    }
   
}
-(void)VerifyTokenSuccess:(NSDictionary *)Dict
{
    NSDictionary *data=[[NSDictionary alloc]initWithDictionary:[Dict valueForKey:@"data"]];
     NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    if (![[data valueForKey:@"Token"]isKindOfClass:[NSNull class]])
            {
            [defaults setObject:[data valueForKey:@"Token"] forKey:@"Token"];
            }
    [self performSegueWithIdentifier:@"T&CScrnAfterRegister" sender:self];
    
}
-(void)VerifyTokenfailure
{
    NSLog(@"Verify token failed");
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtSmsCodeAtSMSScrnAfterSignUpScrn resignFirstResponder];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)AssignVerificationCode:(NSString *)Code
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:Code forKey:@"SMSCode"];
    
    
}
@end
