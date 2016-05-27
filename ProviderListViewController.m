
//
//  ProviderListViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/7/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "ProviderListViewController.h"

@interface ProviderListViewController ()

@end

@implementation ProviderListViewController

- (void)viewDidLoad {
    
    
    NSLog(@"At ViewDidLoad ProviderListViewController-%@",self.catergoryID);
  
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    [service getProviderList:self.catergoryID];
    service.delegate=self;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/*{
    CategoryId = 4;
    CreatedAt = "<null>";
    Description = "";
    EmailId = "ankit1@nifortis.com";
    FaxNumber = 45677776;
    Id = 11;
    MobileNumber = 15777664;
    Name = Ankit;
    Notes = "";
    Status = 1;
    UpdatedAt = "2015-04-08 10:28:07";
    UserId = 100;
}
)*/

-(void)FetchProviderListSuccess:(NSDictionary *)Dict
{
   // NSLog(@"Provider List%@",Dict);
    self.ProviderListArray=[[NSMutableArray alloc]init];
   
    for(NSDictionary *temp in Dict)
    {
        
        ModelForProvider *Data=[[ModelForProvider alloc]initWithDict:[temp valueForKey:@"Name"] DespProvider:[temp valueForKey:@"Description"] Email:[temp valueForKey:@"EmailId"] Mob:[temp valueForKey:@"MobileNumber"] Fax:[temp valueForKey:@"FaxNumber"]CatergoryID:[temp valueForKey:@"CategoryId"] ProviderID:[temp valueForKey:@"Id"]];
               
        
        
        [self.ProviderListArray addObject:Data];
    }
    [self.tableVwForproviderList reloadData];
}
-(void)FetchProviderListFailure
{
    NSLog(@"Unable to fetch provider list");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.ProviderListObj=self.ProviderListArray[indexPath.row];
    [self performSegueWithIdentifier:@"AddingProvider" sender:self];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ProviderListArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProviderListTableViewCell *Cell=[tableView dequeueReusableCellWithIdentifier:@"ProviderListAfterCategory"];
    
    self.ProviderListObj=self.ProviderListArray[indexPath.row];
    
    Cell.lblNameAtProviderList.text=[NSString stringWithFormat:@"%@",self.ProviderListObj.Name];
    return Cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path=[self.tableVwForproviderList indexPathForSelectedRow];
    self.ProviderListObj=self.ProviderListArray[path.row];
    
    SelectedProviderAfterAddViewController *sp=segue.destinationViewController;
    sp.SelectedProviderModel=self.ProviderListObj;
    
    
}
@end
