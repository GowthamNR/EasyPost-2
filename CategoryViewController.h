//
//  CategoryViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/1/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "EasyPost_Service.h"
#import "CategoryList.h"
#import "CategoryListTableViewCell.h"
#import "ProviderListViewController.h"

@interface CategoryViewController : UIViewController<EZPostService,UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,UINavigationBarDelegate,UISearchBarDelegate,UISearchControllerDelegate,UISearchDisplayDelegate,UISearchResultsUpdating>

@property (weak, nonatomic) IBOutlet UITableView *tableVwForCategoryList;
@property(nonatomic,strong)CategoryList *ModelObjc;
@property (strong,nonatomic) NSMutableArray *Categorylist;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)btnAddprovider:(id)sender;

@end
