//
//  addProviderViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/2/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "addProviderViewController.h"

@interface addProviderViewController ()

@end

@implementation addProviderViewController

- (void)viewDidLoad {
    
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
    [service getCategoryList];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)GetCategoryListSuccess:(NSArray *)List
{
    self.Categories=[[NSMutableArray alloc]init];
    
    for (NSDictionary *temp in List)
    {
        CategoryList *feed=[[CategoryList alloc]initWithDict:[temp valueForKey:@"Id"] Logo:[temp valueForKey:@"Icon"] Name:[temp valueForKey:@"Name"]];
        
        [self.Categories addObject:feed];
    }
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    if (buttonIndex!=9) {
        self.ModelObjc=self.Categories[buttonIndex];
        self.categoryId=self.ModelObjc.Id;
        
        self.SelectCategorybtn.titleLabel.text=[NSString stringWithFormat:@"%@",self.ModelObjc.Name];
    }
    
}

-(void)GetCategoryListFailure
{
    NSLog(@"GetCategoryListFailure in add provider");
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

- (IBAction)btnCreateProvider:(id)sender {
    if(self.txtNameAtCreateProvider.text.length<=0||self.txtDescriptionatCreateProvider.text.length<=0||self.txtEmailofProvider.text.length<=0||self.txtMobileNumberofProvider.text.length<=0
       )
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Please fill all the Fields" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        [alrt show];
    }
    else
    {
        if (self.categoryId==nil)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Please Select category" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }
        else
        {
        NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
        
            EasyPost_Service *service=[[EasyPost_Service alloc]init];
        service.delegate=self;
        
        [service CreateProvider:[def valueForKey:@"Token"] catogory:self.categoryId Name:self.txtNameAtCreateProvider.text desc:self.txtDescriptionatCreateProvider.text Email:self.txtEmailofProvider.text Mobile:self.txtMobileNumberofProvider.text Faxnumber:self.txtFaxNumber.text];
        }
    }
}
-(void)CreateProviderSuccess:(NSDictionary *)Dict
{
    if ([[Dict valueForKey:@"success"]isEqual:[NSNumber numberWithInt:1] ]) {
        
      UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:[Dict valueForKey:@"msg"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    }
    else if ([[Dict valueForKey:@"success"] isEqual:[NSNumber numberWithInt:0]])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:[Dict valueForKey:@"errors"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}
-(void)CreateProviderFailure
{
    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Unable to creater provider" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alrt show];
}
- (IBAction)selectCategory:(id)sender {
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc] init];
    
    actionSheet.title = @"Select Catogory";
    
    actionSheet.delegate = self;
    
    for (CategoryList *List in self.Categories)
    {
        
        [actionSheet addButtonWithTitle:[List valueForKey:@"Name"]];
        
    }
    
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.tag=1;
    [actionSheet showInView:self.view];
    

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
