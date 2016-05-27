//
//  TandCViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/9/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "TandCViewController.h"

@interface TandCViewController ()

@end

@implementation TandCViewController

- (void)viewDidLoad {
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
    [service GetTermsAndConditions];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)FetchTAndCSuccess:(NSDictionary *)ResponseForTAndC
{
    NSDictionary *Terms=[[NSDictionary alloc]initWithDictionary:[ResponseForTAndC valueForKey:@"t&c"]];
    
    self.txtVwAtTandCOfAboutUs.text=[Terms valueForKey:@"Text"];
}

-(void)FetchTAndCFailure:(NSString *)ErrorForFailure
{
    NSLog(@"Error At TandConditions About Us");
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

@end
