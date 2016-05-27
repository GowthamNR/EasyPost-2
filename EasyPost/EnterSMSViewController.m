//
//  EnterSMSViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/18/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "EnterSMSViewController.h"
#import "Reachability.h"

@interface EnterSMSViewController ()

@end

@implementation EnterSMSViewController

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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtEmailidAtForgotPassword resignFirstResponder];
}

- (IBAction)btnDoneAtEnterSMSVwCtrl:(id)sender
{
    if (self.txtEmailidAtForgotPassword.text.length<=0)
        {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter your Email" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alert show];
        }
        else
        {
        EasyPost_Service *service=[[EasyPost_Service alloc]init];
                            service.delegate=self;
                            [service ForgotPassword:self.txtEmailidAtForgotPassword.text];
               
        }
}

-(void)ForgotPasswordSuccess:(NSDictionary *)ResponseForForgotPassword
{
    
    NSString *compare=[[ResponseForForgotPassword valueForKey:@"success"]stringValue];    
    if([compare isEqualToString:@"0"])
    {
        UIAlertView *alertforFail=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Not a valid Email" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertforFail show];
    }
    else if([compare isEqualToString:@"1"])
    {
        UIAlertView *alertforsuccess=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Password sent to your Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertforsuccess show];
        
    }
}
-(void)ForgotPasswordFailure:(NSDictionary *)Desp
{
    NSLog(@"Failure for Forgot Password%@",Desp);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
