
//
//  loginWithGmailAndFbViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/18/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "loginWithGmailAndFbViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <GoogleOpenSource/GoogleOpenSource.h>

@interface loginWithGmailAndFbViewController ()

@end

@implementation loginWithGmailAndFbViewController

static NSString * const kClientId = @"1068734241820-radh78bebhm5imnh2v2m3n4p4tct6gqd.apps.googleusercontent.com";

- (void)viewDidLoad {
    
    GPPSignIn *signIn=[GPPSignIn sharedInstance];
    
    //[signIn trySilentAuthentication];
    signIn.shouldFetchGooglePlusUser = YES;
    
    //signIn.shouldFetchGoogleUserEmail = YES;  // Uncomment to get the user's email
    
    // You previously set kClientId in the "Initialize the Google+ client" step
    signIn.clientID = kClientId;
    
    // Your server's OAuth 2.0 client ID

    //signIn.homeServerClientID = @"";
    
    // Uncomment one of these two statements for the scope you chose in the previous step
    
    
    signIn.scopes = @[ kGTLAuthScopePlusLogin ];
     // scope
    
    
    signIn.scopes = @[ @"profile",@"https://www.googleapis.com/auth/userinfo.email",@"https://www.googleapis.com/auth/userinfo.profile"];
   
    // "profile" scope
    
    // Optional: declare signIn.actions, see "app activities"
    
    signIn.delegate = self;
    
    
    
    
//-------------------------------------------FaceBooK logout
    FBSession* session = [FBSession activeSession];
    [session closeAndClearTokenInformation];
    [session close];
    [FBSession setActiveSession:nil];
    
    NSHTTPCookieStorage* cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray* facebookCookies = [cookies cookiesForURL:[NSURL URLWithString:@"https://facebook.com/"]];
    
    for (NSHTTPCookie* cookie in facebookCookies) {
        [cookies deleteCookie:cookie];
    }
    
    
 //------------------------FacebookLogin Code
    
    
    FBLoginView *loginView =[[FBLoginView alloc] initWithReadPermissions:
     @[@"public_profile", @"email"]];
    loginView.delegate=self;
    loginView.center = self.view.center;
    [self.view addSubview:loginView];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)refreshInterfaceBasedOnSignIn {
   
    if ([[GPPSignIn sharedInstance] authentication]) {
        // The user is signed in.
        self.signInButton.hidden = YES;
        // Perform other actions here, such as showing a sign-out button
    } else
    {
        self.signInButton.hidden = NO;
        // Perform other actions here
    }
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

-(void)finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error
{
//    NSString *accessToken=[[NSString alloc]init];
//  
//    accessToken=[auth valueForKey:@"accessToken"];
    
    EasyPost_Service *serviceForGoogleData=[[EasyPost_Service alloc]init];
    
    serviceForGoogleData.delegate=self;
    
    [serviceForGoogleData GettingDataFromGoogleUsingAccessToken:[auth valueForKey:@"accessToken"]];

        NSLog(@"successful Google method");
    
    
    
    
    
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=%@",accessToken]];
//    
//    // Create a request object using the URL.
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    // Prepare for the response back from the server
//    NSHTTPURLResponse *response = nil;
//    
//    // Send a synchronous request to the server (i.e. sit and wait for the response)
//    
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//   
//    NSDictionary *result =[NSJSONSerialization JSONObjectWithData:responseData
//                                                          options:kNilOptions
//                                                            error:&error];
//    NSLog(@"Result Dictionary-%@",result);
//    
//    // Check if an error occurred
//    if (error != nil) {
//        
//        NSLog(@"%@", [error localizedDescription]);
//        // Do something to handle/advise user.
//        
//        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Login error"
//                                                          message:@""
//                                                         delegate:nil
//                                                cancelButtonTitle:@"OK"
//                                                otherButtonTitles:nil];
//        [message show];
//        
//    }
//
//    
//    if (error) {
//            
//            NSLog(@"Error-%@",[error localizedDescription]);
//            
//        }
//    
//    else
//        
//    {
//        [self refreshInterfaceBasedOnSignIn];
//    }
//}
//
//
    
}

-(void)GettingDataFromGoogleSuccess:(NSDictionary *)ResponseFromGmail
{
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
    [service GooglePlusLoginByUser:[ResponseFromGmail valueForKey:@"email"]];
}
-(void)GettingDataFromGoogleFailure
{
    NSLog(@"Failed To get Data From Google");
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    //NSLog(@"The other user details is-%@",user);
    
//    {
//        email = "aslanyanhaik@gmail.com";
//        "first_name" = Haik;
//        gender = male;
//        id = 420311198142548;
//        "last_name" = Aslanyan;
//        link = "https://www.facebook.com/app_scoped_user_id/420311198142548/";
//        locale = "en_US";
//        name = "Haik Aslanyan";
//        timezone = "5.5";
//        "updated_time" = "2015-03-04T08:26:10+0000";
//        verified = 1;
//    }
    
    EasyPost_Service *service =[[EasyPost_Service alloc]init];
    service.delegate=self;
    [service FaceBookLoginByUser:[user objectForKey:@"email"]];

    }

-(void)LoginByFaceBookSuccess:(NSDictionary *)ResponseFromServer
{
    NSLog(@"Response from server at LoginByFaceBookSuccess-%@",ResponseFromServer);
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSDictionary *Data=[[NSDictionary alloc]initWithDictionary:[ResponseFromServer valueForKey:@"Data"]];
    
    if (![[Data valueForKey:@"EmailId"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[Data valueForKey:@"EmailId"] forKey:@"email"];
    }
    
    if (![[Data valueForKey:@"Address"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[Data
                             valueForKey:@"Address"] forKey:@"Address"];
    }
    
    if (![[Data valueForKey:@"Mobile"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[Data valueForKey:@"Mobile"] forKey:@"Mobile"];
    }
    
    if (![[Data valueForKey:@"Name"]isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[Data valueForKey:@"Name"] forKey:@"Name"];
    }
    
    if (![[Data valueForKey:@"IdPhotoUrl"]isKindOfClass:[NSNull class]])
    {
        
        
        [defaults setObject:[Data valueForKey:@"IdPhotoUrl"] forKey:@"IdPhotoUrl"];
    }
    
    if (![[Data valueForKey:@"SignatureUrl"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[Data valueForKey:@"SignatureUrl"] forKey:@"SignatureUrl"];
        
    }
    
    if (![[Data valueForKey:@"Token"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[Data valueForKey:@"Token"] forKey:@"Token"];
       
        NSString *tokenFb=[defaults valueForKey:@"Token"];
        NSLog(@"TokenAfterFBLogin-%@",tokenFb);
    }
    
    if (![[Data valueForKey:@"UserId"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[Data
                             valueForKey:@"UserId"] forKey:@"UserId"];
    }
    
    [self performSegueWithIdentifier:@"ToHomeScreen" sender:self];

}

-(void)LoginByFaceBookFailure
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Unable to login from Facebook" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert show];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:@"facbook" forKey:@"RegisterType"];
    
    
    [self performSegueWithIdentifier:@"SignUpScreen" sender:self];
    

}
-(void)LoginByGooglePlusSuccess:(NSDictionary *)responseFromServer
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSDictionary *DataAtGmail=[[NSDictionary alloc]initWithDictionary:[responseFromServer valueForKey:@"Data"]];
    
    
    if (![[DataAtGmail valueForKey:@"EmailId"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[DataAtGmail valueForKey:@"EmailId"] forKey:@"email"];
    }
    
    if (![[DataAtGmail valueForKey:@"Address"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[DataAtGmail
                             valueForKey:@"Address"] forKey:@"Address"];
    }
    
    if (![[DataAtGmail valueForKey:@"Mobile"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[DataAtGmail valueForKey:@"Mobile"] forKey:@"Mobile"];
    }
    
    if (![[DataAtGmail valueForKey:@"Name"]isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[DataAtGmail valueForKey:@"Name"] forKey:@"Name"];
    }
    
    if (![[DataAtGmail valueForKey:@"IdPhotoUrl"]isKindOfClass:[NSNull class]])
    {
        
        
        [defaults setObject:[DataAtGmail valueForKey:@"IdPhotoUrl"] forKey:@"IdPhotoUrl"];
    }
    
    if (![[DataAtGmail valueForKey:@"SignatureUrl"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[DataAtGmail valueForKey:@"SignatureUrl"] forKey:@"SignatureUrl"];
        
    }
    
    if (![[DataAtGmail valueForKey:@"Token"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[DataAtGmail valueForKey:@"Token"] forKey:@"Token"];
        
        NSLog(@"TokenAtGoogle-%@",[defaults valueForKey:@"Token"]);
        
    }
    
    if (![[DataAtGmail valueForKey:@"UserId"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[DataAtGmail
                             valueForKey:@"UserId"] forKey:@"UserId"];
    }
 
    [self performSegueWithIdentifier:@"ToHomeScreen" sender:self];
}

-(void)LoginByGooglePlusFailure
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Unable to login from Gmail" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
   
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:@"google" forKey:@"RegisterType"];

    [alert show];
    
    
    [self performSegueWithIdentifier:@"SignUpScreen" sender:self];
}


- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
   
    NSLog(@"loginViewShowingLoggedInUser");
    
    }


- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    NSLog(@"loginViewShowingLoggedOutUser");
    }

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    // If the user performs an action outside of you app to recover,
    // the SDK provides a message, you just need to surface it.
    // This handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures that happen outside of the app
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    }
    else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    }
    else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}
- (IBAction)btnForgotPassword:(id)sender {
    
}

- (IBAction)btnDone:(id)sender {
    
    if (self.txtUserName.text.length<=0||self.txtPassword.text.length<=0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please fill all the fields" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alert show];
    }
   
    else
    {
        EasyPost_Service *service=[[EasyPost_Service alloc]init];
        service.delegate=self;
        [service LoginUser:self.txtUserName.text Password:self.txtPassword.text];
        

    }
}


-(void)LoginSuccess:(NSDictionary *)ResponseAfterLogin
{
    NSDictionary *data=[[NSDictionary alloc]initWithDictionary:[ResponseAfterLogin valueForKey:@"Data"]];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    if (![[data valueForKey:@"EmailId"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[data valueForKey:@"EmailId"] forKey:@"email"];
    }
    
    if (![[data valueForKey:@"Address"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[data valueForKey:@"Address"] forKey:@"Address"];
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
    if (![[data valueForKey:@"Telephone"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[data valueForKey:@"Telephone"] forKey:@"Telephone"];
        
    }
    
    if (![[data valueForKey:@"Token"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[data valueForKey:@"Token"] forKey:@"Token"];
        NSLog(@"Token After login-%@",[defaults valueForKey:@"Token"]);
    }
    
    if (![[data valueForKey:@"UserId"]isKindOfClass:[NSNull class]])
    {
        
        [defaults setObject:[data valueForKey:@"UserId"] forKey:@"UserId"];
        
        NSDictionary *terms=[[NSDictionary alloc]initWithDictionary:[data valueForKey:@"T&C"]];
        if([data valueForKey:@"UserTermsID"]==[terms valueForKey:@"Version_Id"])
        {
            [self performSegueWithIdentifier:@"ToHomeScreen" sender:self];
        }
        else
        {
            
         [self performSegueWithIdentifier:@"NewTermsAndconditions" sender:self];
        }
    }
}

-(void)LoginFailure
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Unable to Login" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtUserName resignFirstResponder];
    [self.txtPassword resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
