//
//  SignUpViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/19/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
   
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(Emailunique) name:@"EmailUnique" object:nil];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(UserIDunique) name:@"UserIDUnique" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MobileNumUnique) name:@"MobileNumUnique" object:nil];
   
}

-(void)MobileNumUnique

{
    if ([self.txtPassword.text isEqualToString:self.txtRetypePassword.text])
    {
   EasyPost_Service *service=[[EasyPost_Service alloc]init];
   
        service.delegate=self;
       
        [service RegisterTheUser:self.txtFullName.text  EmailID:self.txtEmailID.text Password:self.txtPassword.text Mobilenum:self.txtMobileNumber.text LastName:self.txtLastName.text telephone:self.txtTelephone.text];
      
    }
    else
    {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Please enter matching passwords" message:@"Passwords not matching" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alert show];
    }
   
}


-(void)SuccessForUserRegistration:(NSDictionary *)ResponseAfterRegister
{
    NSDictionary *data=[[NSDictionary alloc]initWithDictionary:[ResponseAfterRegister valueForKey:@"Data"]];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];

    if (![[data valueForKey:@"EmailId"]isKindOfClass:[NSNull class]])
    {
    
    [defaults setObject:[data valueForKey:@"EmailId"] forKey:@"email"];
    }
    if (![[data valueForKey:@"Mobile"]isKindOfClass:[NSNull class]])
    {
    
    [defaults setObject:[data valueForKey:@"Mobile"] forKey:@"Mobile"];
    }
    
    if (![[data valueForKey:@"Name"]isKindOfClass:[NSNull class]])
    {
    [defaults setObject:[data valueForKey:@"Name"] forKey:@"Name"];
    }
    
    if (![[data valueForKey:@"IdPhotoUrl"]isKindOfClass:[NSNull class]])
    {

    
    [defaults setObject:[data valueForKey:@"IdPhotoUrl"] forKey:@"IdPhotoUrl"];
    }
    
    if (![[data valueForKey:@"SignatureUrl"]isKindOfClass:[NSNull class]])
    {

    [defaults setObject:[data valueForKey:@"SignatureUrl"] forKey:@"SignatureUrl"];
    
    }
    

    self.VerificationCode=[data valueForKey:@"Verification_code"];
    
    [self performSegueWithIdentifier:@"SmsCodeScrnAfterRegister" sender:self];
  
}

-(void)FailedToRegisterUser
{
    UIAlertView *ALertForFailure=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Unable to register " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [ALertForFailure show];
    
}



-(void)Emailunique
{
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
 [service checkingTheMobileNumUnique:self.txtMobileNumber.text];
}


-(void)SuccessForUniqueMobileNum:(NSString *)success
{
   [[NSNotificationCenter defaultCenter]postNotificationName:@"MobileNumUnique" object:nil];
}


-(void)FailedForUniqueMobileNum:(NSString *)Failure
{
    UIAlertView *ALertForMobile=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please Provide a unique Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [ALertForMobile show];
}


//-(void)UserIDunique
//{
//    EasyPost_Service *service=[[EasyPost_Service alloc]init];
//    service.delegate=self;
//    
//    
//}
//
//-(void)SuccessForUniqueUserID:(NSString *)success
//{
//   [[NSNotificationCenter defaultCenter]postNotificationName:@"UserIDUnique" object:nil];
//
//}
//-(void)FailedForUniqueUserID:(NSString *)Failure
//{
//    UIAlertView *ALertForUserID=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please Provide a unique UserID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [ALertForUserID show];
//}

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
-(void)SucessForUniqueEmailID:(NSString *)success
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"EmailUnique" object:nil];
}

-(void)FailedForUniqueEmailID:(NSString *)Failure
{
    UIAlertView *ALertForEmail=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please Provide a unique EmailID" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [ALertForEmail show];
}

- (IBAction)btnDoneAtSignUpScrn:(id)sender

{
    if (self.txtFullName.text.length<=0||self.txtEmailID.text.length<=0||self.txtMobileNumber.text.length<=0||self.txtPassword.text.length<=0||self.txtRetypePassword.text.length<=0)
    {
        
        UIAlertView *view =[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please fill all the fields" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        [view show];
    }
    
    else
    {
        EasyPost_Service *service=[[EasyPost_Service alloc]init];
        service.delegate=self;
        [service checkingTheEmailUnique:self.txtEmailID.text];
        
    }
    
//[self performSegueWithIdentifier:@"SmsCodeScrnAfterRegister" sender:self];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtFullName resignFirstResponder];
    [self.txtEmailID resignFirstResponder];
   
    [self.txtPassword resignFirstResponder];
    [self.txtRetypePassword resignFirstResponder];
   
    [self.txtMobileNumber resignFirstResponder];
    [self.txtTelephone resignFirstResponder];

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
//    if (textField==self.txtUserid)
//    {
//        UIAlertView *alertForUserId=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"UserID can be Your Unique Identification number from a authorised Organisation\n(For eg:Driving License,PassPort)" delegate:self
//                                                    cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        
//        [alertForUserId show];
//    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SMSScrnAfterSignUpViewController *sc=[[SMSScrnAfterSignUpViewController alloc]init];
    [sc AssignVerificationCode:self.VerificationCode];
}
@end
