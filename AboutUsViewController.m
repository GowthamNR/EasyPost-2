//
//  AboutUsViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/9/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "AboutUsViewController.h"


@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

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

- (IBAction)btnHowitWorks:(id)sender {
}

- (IBAction)btnContactUs:(id)sender {
}

- (IBAction)btnTandC:(id)sender {
}

- (IBAction)btnShareApp:(id)sender {
    
    NSString *textItem = @"Check out the yourAppNameHere app: itunes http link to your app here";
    UIImage *imageToShare = [UIImage imageNamed:@"anyImage.png"];
    
    NSArray *items = [NSArray arrayWithObjects:textItem,imageToShare,nil];
    
    UIActivityViewController *activityVC =
    
    [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    
    activityVC.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeSaveToCameraRoll];
    
    activityVC.completionHandler = ^(NSString *activityType, BOOL completed)
    {
//        NSLog(@" activityType: %@", activityType);
//        NSLog(@" completed: %i", completed);
    };
        [self presentViewController:activityVC animated:YES completion:nil];

}
@end
