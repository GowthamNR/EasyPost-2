//
//  myProfileViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/7/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "myProfileViewController.h"

@interface myProfileViewController ()

@end

@implementation myProfileViewController

- (void)viewDidLoad {
    
//    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
//    self.lblNameAtProfile.text=[def valueForKey:@"Name"];
//    self.lblAddress.text=[def valueForKey:@"Address"];
//    self.lblEmail.text=[def valueForKey:@"email"];
//    self.lblMobileNumber.text=[def valueForKey:@"Mobile"];
//    self.lblPhoneNumber.text=[def valueForKey:@"Phone"];
//    self.lblIdAtProfile.text=[def valueForKey:@"UserId"];
//    self.lblPassword.text=@"********";
    [super viewDidLoad];
    
   EasyPost_Service *service= [[EasyPost_Service alloc] init];
    service.delegate=self;
    [service GetUserDetails];
    // Do any additional setup after loading the view.
}

-(void)getUser:(NSDictionary *)dict
{
    
  
    self.lblNameAtProfile.text=[NSString stringWithFormat:@"%@",[dict valueForKey:@"FirstName"]];
    self.LastName.text=[NSString stringWithFormat:@"%@",[dict valueForKey:@"LastName"]];
    self.lblEmail.text=[NSString stringWithFormat:@"%@",[dict valueForKey:@"EmailId"]];
    self.lblIdAtProfile.text=[NSString stringWithFormat:@"%@",[dict valueForKey:@"Id"]];
    self.lblMobileNumber.text=[NSString stringWithFormat:@"%@",[dict valueForKey:@"Mobile"]];
    self.lblPhoneNumber.text=[NSString stringWithFormat:@"%@",[dict valueForKey:@"Telephone"]];

}

-(void)failedGetUserDetails:(NSString *)msg
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Failed to get details" message:@"" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
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
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)Idfront:(id)sender {
    
    NSLog(@"IDFront");
    
    
}
- (IBAction)IdBack:(id)sender {
    
    
    NSLog(@"IDBack");

}
- (IBAction)Signature:(id)sender {
    NSLog(@"Signature");

}
@end
