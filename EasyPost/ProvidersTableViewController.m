//
//  ProvidersTableViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/14/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "ProvidersTableViewController.h"

@interface ProvidersTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ProvidersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
    [service GetMyprovider];
}
-(void)getMyProviderListSuccess:(NSDictionary *)dict
{
    self.ProviderDataarray=[[NSMutableArray alloc]init];
   
   // NSDictionary *data=[[NSDictionary alloc]initWithDictionary:[dict valueForKey:@"data"]];
                                                        
    for (NSDictionary *temp in dict)
    {
    
    Providers *ProvidersList=[[Providers alloc]initWithDict:[temp valueForKey:@"ProviderName"] Desp:[temp valueForKey:@"Description"] Notes:[temp valueForKey:@"Notes"] ProviderID:[temp valueForKey:@"ProviderId"] CatergoryId:[temp valueForKey:@"CategoryId"]];
    
    [self.ProviderDataarray addObject:ProvidersList];
    }
    
    [self.tableview reloadData];
    
}

-(void)getMyProviderListFailure
{
    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Unable to get Providers" message:@"Please try later" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alrt show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"CustomerProviderData" sender:self];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.ProviderDataarray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.modelObjcForProviders=self.ProviderDataarray[indexPath.row];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",self.modelObjcForProviders.ProviderName];
    cell.textLabel.backgroundColor=[UIColor yellowColor];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    cell.textLabel.font=[UIFont systemFontOfSize:30.0];
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"CustomerProviderData"])
    {
        NSIndexPath *path=[self.tblVwForMyProviders indexPathForSelectedRow];
        self.modelObjcForProviders=self.ProviderDataarray[path.row];
       // NSLog(@"%@",self.modelObjcForProviders);
        UserDetailsForAnProviderViewController *ProviderAtSegue=segue.destinationViewController;
       
        ProviderAtSegue.providersAtUserDetails=self.modelObjcForProviders;
}
}
@end
