//
//  UpdateDetails.m
//  EasyPost
//
//  Created by Bifortis on 4/16/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "UpdateDetails.h"

@interface UpdateDetails ()

@end

@implementation UpdateDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Flag=false;
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
- (IBAction)Continue:(id)sender {
    [self performSegueWithIdentifier:@"providers" sender:self];
}

- (IBAction)btnEmailCheckBox:(id)sender {
    
    if (self.Flag==false) {
        [self.EmailCheckboxBtn setImage:[UIImage imageNamed:@"checkboxclicked.png"] forState:UIControlStateNormal];
        self.Flag=true;
    }
    else
    {
        [self.EmailCheckboxBtn setImage:[UIImage imageNamed:@"checkBox@2x.png"] forState:UIControlStateNormal];
        self.Flag=false;
    }
    
}
- (IBAction)btnAddressCheckBox:(id)sender
        {
    if (self.Flag==false)
    {
        [self.AddressCheckBoxBtn setImage:[UIImage imageNamed:@"checkboxclicked.png"] forState:UIControlStateNormal];
        self.Flag=true;
    }
    else
    {
        [self.AddressCheckBoxBtn setImage:[UIImage imageNamed:@"checkBox@2x.png"] forState:UIControlStateNormal];
        self.Flag=false;
    }

}
- (IBAction)btnMobileCheckBox:(id)sender {
    
    if (self.Flag==false)
    {
        [self.mobileCheckBoxbtn setImage:[UIImage imageNamed:@"checkboxclicked.png"] forState:UIControlStateNormal];
        self.Flag=true;
    }
    else
    {
        [self.mobileCheckBoxbtn setImage:[UIImage imageNamed:@"checkBox@2x.png"] forState:UIControlStateNormal];
        self.Flag=false;
    }

}
- (IBAction)btnPhoneCheckBox:(id)sender {
    
    if (self.Flag==false)
    {
        [self.PhoneCheckBoxBtn  setImage:[UIImage imageNamed:@"checkboxclicked.png"] forState:UIControlStateNormal];
        self.Flag=true;
    }
    else
    {
        [self.PhoneCheckBoxBtn setImage:[UIImage imageNamed:@"checkBox@2x.png"] forState:UIControlStateNormal];
        self.Flag=false;
    }

}

@end
