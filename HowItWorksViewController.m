//
//  HowItWorksViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/9/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "HowItWorksViewController.h"

@interface HowItWorksViewController ()

@end

@implementation HowItWorksViewController
{
    NSArray *myViewControllers;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    
    UIViewController *p1 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"Page1"];
    UIViewController *p2 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"Page2"];
    UIViewController *p3 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"Page3"];
    
    myViewControllers = @[p1,p2,p3];
    
    [self setViewControllers:@[p1]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO completion:nil];
    
}

-(UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    return myViewControllers[index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
     viewControllerBeforeViewController:(UIViewController *)viewController
{
    
//    NSUInteger currentIndex = [myViewControllers indexOfObject:viewController];
//    
//    --currentIndex;
//    currentIndex = currentIndex % (myViewControllers.count);
//    
//    return [myViewControllers objectAtIndex:currentIndex];
    
    UIViewController *p1 = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"Page1"];
    
    
    return p1;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerAfterViewController:(UIViewController *)viewController
{
    
    NSUInteger currentIndex = [myViewControllers indexOfObject:viewController];
    
    ++currentIndex;
    
    currentIndex = currentIndex % (myViewControllers.count);
    
    return [myViewControllers objectAtIndex:currentIndex];
}

-(NSInteger)presentationCountForPageViewController:
(UIPageViewController *)pageViewController
{
    return myViewControllers.count;
}

-(NSInteger)presentationIndexForPageViewController:
(UIPageViewController *)pageViewController
{
    return 0;
}

@end
