//
//  SignatureViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/23/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "SignatureViewController.h"

@interface SignatureViewController ()

@end

@implementation SignatureViewController

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

- (IBAction)btnReset:(id)sender
{
    [self.SignatureVw erase];
}

- (IBAction)btnDone:(id)sender {
    
    UIImage *image=[[UIImage alloc]init];
    PPSSignatureView *GetImage=[[PPSSignatureView alloc]init];
    
    image=[GetImage imageWithView:self.SignatureVw];
   
    NSLog(@"Image-%@",image);
   
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
    [service UploadSignature:image];
    
   }
-(void)SignatureUploadedSuccess:(NSDictionary *)ResponseForSignature
{
    HelperAndConstants *help=[[HelperAndConstants alloc]init];
    
    NSDictionary *ParseForImageName=[[NSDictionary alloc]initWithDictionary:[ResponseForSignature valueForKey:@"Data"]];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[ParseForImageName valueForKey:@"msg"] forKey:@"SigFileName"];
    
    //Returning image of Signature can use later
 
[help getImage:[ParseForImageName valueForKey:@"msg"] andIsUserDp:NO andUserId:nil];
    
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                    message:@"Signature uploaded Successfully"
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    alert.tag = 7;
    [alert show];
   
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==7) {
        [self performSegueWithIdentifier:@"Home" sender:self];
    }
}

-(void)SignatureUploadedFailure
{
        NSLog(@"SignatureUploadedFailure AT SignatureViewController.m ");
}
@end
