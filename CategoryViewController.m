//
//  CategoryViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/1/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController ()
@property(nonatomic,assign)BOOL isFiltered;
@property(nonatomic,strong)NSMutableArray *filteredArray;
@end

@implementation CategoryViewController

-(void)viewDidLoad {
    
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
    [service getCategoryList];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
//                                   initWithTarget:self
//                                   action:@selector(dismissKeyboard)];
//    
//    [self.view addGestureRecognizer:tap];
}


- (void) dismissKeyboard
{
    // add self
    [self.searchBar resignFirstResponder];
}



-(void)GetCategoryListSuccess:(NSArray *)List
{
     NSLog(@"%@",List);
    
    self.Categorylist=[[NSMutableArray alloc]init];
    
    for (NSDictionary *temp in List)
    {
        CategoryList *feed=[[CategoryList alloc]initWithDict:[temp valueForKey:@"Id"] Logo:[temp valueForKey:@"Icon"] Name:[temp valueForKey:@"Name"]];
    
    [self.Categorylist addObject:feed];
    }
    
    [self.tableVwForCategoryList reloadData];
}
-(void)GetCategoryListFailure
{
    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Unable to get Category" message:@"Please try later" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alrt show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isFiltered) {
        
        return [self.filteredArray count];
        
    }else{
        return [self.Categorylist count];
    }
    
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

        [self performSegueWithIdentifier:@"NextScrn" sender:self];
    
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CategoryList"];
   
    if (self.isFiltered) {
        
        self.ModelObjc=self.filteredArray[indexPath.row];
        
        cell.lblNameAtcategoryCell.text=[NSString stringWithFormat:@"%@",self.ModelObjc.Name];
 
    }
    else{
        self.ModelObjc=self.Categorylist[indexPath.row];
        
        cell.lblNameAtcategoryCell.text=[NSString stringWithFormat:@"%@",self.ModelObjc.Name];
 
    }
    
        return cell;
   
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"NextScrn"])
    {
    NSIndexPath *path=[self.tableVwForCategoryList indexPathForSelectedRow];
        
        if (self.isFiltered) {
            self.ModelObjc=self.filteredArray[path.row];
            
            ProviderListViewController *Provider=segue.destinationViewController;
            Provider.catergoryID=[self.ModelObjc.Id copy];
            
        }
        else{
            self.ModelObjc=self.Categorylist[path.row];
            
            ProviderListViewController *Provider=segue.destinationViewController;
            Provider.catergoryID=[self.ModelObjc.Id copy];
        }
    
    }
    else if([segue.identifier isEqualToString:@"createProvider"])
    {
        NSLog(@"CreateProvider");
    }
}
- (IBAction)btnAddprovider:(id)sender {
    
    [self performSegueWithIdentifier:@"createProvider" sender:self];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length<=0) {
        self.isFiltered=false;
    } else {
        self.isFiltered=true;
        self.filteredArray=[[NSMutableArray alloc]init];
   
            
        for (CategoryList *category in self.Categorylist) {
            NSRange nameRange = [category.Name rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange descriptionRange = [category.description rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound || descriptionRange.location != NSNotFound)
            {
                [self.filteredArray addObject:category];
            }
  
        }
            
        
    }
    
    [self.tableVwForCategoryList reloadData];
        
        
        
        
    
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
    [service getCategoryList];
}



@end
