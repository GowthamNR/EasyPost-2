//
//  ProvidersTableViewController.h
//  EasyPost
//
//  Created by Bifortis on 4/14/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyPost_Service.h"
#import "Providers.h"
#import "UserDetailsForAnProviderViewController.h"
@interface ProvidersTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,EZPostService>
@property (strong,nonatomic)NSMutableArray *ProviderDataarray;
@property (strong,nonatomic)Providers *modelObjcForProviders;
@property (weak, nonatomic) IBOutlet UITableView *tblVwForMyProviders;
@end

