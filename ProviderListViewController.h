//
//  ProviderListViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/7/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryViewController.h"
#import "EasyPost_Service.h"
#import "ModelForProvider.h"
#import "ProviderListTableViewCell.h"
#import "SelectedProviderAfterAddViewController.h"


@interface ProviderListViewController : UIViewController<EZPostService,UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSString *catergoryID;
@property (strong,nonatomic) NSMutableArray *ProviderListArray;
@property (strong,nonatomic) ModelForProvider *ProviderListObj;

@property (weak, nonatomic) IBOutlet UITableView *tableVwForproviderList;

@end
