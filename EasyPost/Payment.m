//
//  Payment.m
//  EasyPost
//
//  Created by Bifortis on 4/16/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "Payment.h"

@interface Payment ()

@end

@implementation Payment

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
- (IBAction)backToUpdate:(id)sender {
    [self performSegueWithIdentifier:@"backToUpdateDetails" sender:self];
}

- (IBAction)backToProvidersSelect:(id)sender {
    [self performSegueWithIdentifier:@"backToProviders" sender:self];
}
- (IBAction)PayButton:(id)sender {
    
    
}
@end
