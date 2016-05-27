//
//  ViewController.m
//  EasyPost
//
//  Created by Bifortis on 3/18/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
   self.imgVwAtSplashScrren.alpha = 0.0;
    
    [UIView animateWithDuration:2.2 animations:^{
        self.imgVwAtSplashScrren.alpha = 1.0;
       self.imgVwAtSplashScrren.transform =CGAffineTransformMakeScale(1.3,1.3);
    }];

    [self performSelector:@selector(toTermsAndConditions) withObject:self afterDelay:3.5];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)toTermsAndConditions
{
    [self performSegueWithIdentifier:@"LoginScrn" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
