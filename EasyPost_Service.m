
//
//  EasyPost_Service.m
//  EasyPost
//
//  Created by Bifortis on 3/20/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "EasyPost_Service.h"
#import "AFNetworking.h"

@implementation EasyPost_Service

-(void)GettingDataFromGoogleUsingAccessToken:(NSString *)AccessToken
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=%@",AccessToken]];
    
    // Create a request object using the URL.
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSError *error;
        NSDictionary *result =[NSJSONSerialization JSONObjectWithData:responseObject
                                                              options:kNilOptions
                                                                error:&error];
                               
        [self.delegate GettingDataFromGoogleSuccess:result];
             
   
    }
     
                              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                  [self.delegate GettingDataFromGoogleFailure];
                                  
                              }];
    [op start];

}

//Service to check EmailID Unique
-(void)checkingTheEmailUnique:(NSString *)emailId
{
    NSString *post=[[NSString alloc]initWithFormat:@" EmailId=%@",emailId];
    
    NSLog(@"postData at urlServicegetGetuserwall :%@",post);
    
    NSString *Url =[BaseURL stringByAppendingString:@"/access/IsEmailIdUnique"];
    
    NSURL *URLForCall=[NSURL URLWithString:Url];
    
    NSData *postData=[post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
    
    [request setURL:URLForCall];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"contentLength"];
    [request setHTTPBody:postData];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"dictionary AT checkingTheEmailID successBlock%@",dict);
        
    [self.delegate SucessForUniqueEmailID:@"Success"];
            
        
    }
     
                              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                  
                                  
                                  [self.delegate FailedForUniqueEmailID:@"Failed"];
                                  
                              }];
    [op start];
    

}
//Service to check userID Unique
-(void)checkingTheUserIDUnique:(NSString *)Userid
{
    NSString *post=[[NSString alloc]initWithFormat:@"UserId=%@",Userid];
    
    NSLog(@"postData at urlServicegetGetuserwall :%@",post);
    
    NSString *Url =[BaseURL stringByAppendingString:@"/access/IsUserIdUnique"];
    
    NSURL *URLForCall=[NSURL URLWithString:Url];
    
    NSData *postData=[post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
    
    
    [request setURL:URLForCall];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"contentLength"];
    [request setHTTPBody:postData];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"dictionary AT checkingTheUnique USerID successBlock%@",dict);
        [self.delegate SuccessForUniqueUserID:@"Success"];
   
    }
     
                              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                  
                                  [self.delegate FailedForUniqueUserID:@"Failed"];
                                  
                              }];
    [op start];
    
    
}
//Service to check Mobile Number Unique
-(void)checkingTheMobileNumUnique:(NSString *)MobileNumber
{
    NSString *post=[[NSString alloc]initWithFormat:@"Mobile=%@",MobileNumber];
    
    NSLog(@"postData at urlServicegetGetuserwall :%@",post);
    
    NSString *Url =[BaseURL stringByAppendingString:@"/access/IsMobileUnique"];
    
    NSURL *URLForCall=[NSURL URLWithString:Url];
    
    NSData *postData=[post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
    
    
    [request setURL:URLForCall];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"contentLength"];
    [request setHTTPBody:postData];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSLog(@"dictionary AT checkingTheMobileNumUnique successBlock%@",dict);
        [self.delegate SuccessForUniqueMobileNum:@"Success"];
        
    }
     
                              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                  [self.delegate FailedForUniqueMobileNum:@"Failure"];
                                 
                                  
                              }];
    [op start];
    
    
}
//service to redister the user after unique emailID,userid and MobileNum

-(void)RegisterTheUser:(NSString *)Name EmailID:(NSString *)emailID Password:(NSString *)Password Mobilenum:(NSString *)MobileNum LastName:(NSString*)Lname telephone:(NSString *)TelNum
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/SignUp"];

    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
//    {"Name":"Test","UserId":"1ep5tre","EmailId":"sagar@mail.com","Password":"abcdef","Mobile":"9738255182","Address":"#1173, 23rd","reg_type":""}
    
   // NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSString *Registertype=@"";
    
    NSDictionary *parameters =
 
    @{@"FirstName":Name,@"LastName":Lname,@"EmailId":emailID,@"Password":Password,@"Mobile":MobileNum,@"reg_type":Registertype,@"Telephone":TelNum};
    
    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
       
        NSError *error=nil;
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        
        NSLog(@"Succesful Registration response**%@",dict);

        [self.delegate SuccessForUserRegistration:dict];
        
    }

          failure:^(NSURLSessionDataTask *task, NSError *error) {
              NSLog(@"Error at register User-%@",[error localizedDescription]);
              [self.delegate FailedToRegisterUser];
              
              
          }];
    
}
//Service to loign user

-(void)LoginUser :(NSString *)UserEmail Password:(NSString *)PassWord
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/Login"];
    
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSDictionary *parameters =
    @{@"EmailId":UserEmail,@"Password":PassWord};

    
    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
    {
        
        NSError *error=nil;
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
       
        /*//Address = "#3,1st main";
         //EmailId = "gowtham@bifortis.com";
         //Id = 4;
        // IdPhotoUrl = "<null>";
         //Mobile = 9876543210;
         //Name = gowtham;
         RegistrationType = 0;
         //SignatureUrl = "<null>";
         Telephone = "-";
         Token = GM9V69DQ4VZCHLCDHIJJNQTWRTMYZWJN;
         Updated = "2015-03-20 13:48:20";
         UserId = bifortis112;*/
        
        [self.delegate LoginSuccess:dict];
    }
     
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              NSLog(@"Error-%@",error);
              
              [self.delegate LoginFailure];
              
              
          }];
}

-(void)UploadSignature:(UIImage *)Signature
{
    
    NSString *requestForURL = [BaseURL stringByAppendingString:@"/access/Signature"];
   
    NSURL *Url=[[NSURL alloc]initWithString:requestForURL];
    
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:Url];
    
    __unsafe_unretained ASIFormDataRequest *weakRequest = request;
    
   
    NSData *data =UIImageJPEGRepresentation(Signature, 1.0);
    
    
    [weakRequest setRequestMethod:@"POST"];
    
    [weakRequest setData:data withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:@"SignatureImg"];
    
    NSString *accessToken = [[NSUserDefaults standardUserDefaults]objectForKey:@"Token"];
    
    
    
    [weakRequest setPostValue:accessToken forKey:@"token"];

    [weakRequest setCompletionBlock:^{
        NSData *response = [weakRequest responseData];
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];
        
        
        NSLog(@"JsonDict at UploadSignature Service-%@",jsonDictionary);
        
        [self.delegate SignatureUploadedSuccess:jsonDictionary];
        
    }];
    
    [weakRequest setFailedBlock:^{
        NSError *error = [weakRequest error];
        NSLog(@"error:%@",error);
        [self.delegate SignatureUploadedFailure];
    }];
    
    [weakRequest startSynchronous];

}
-(void)sendIdentificationImage:(UIImage *)imageSelected Side:(NSString *)Side
{
    NSString *requestForURL = [BaseURL stringByAppendingString:@"/access/PhotoImg"];
    
    NSURL *Url=[[NSURL alloc]initWithString:requestForURL];
    
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:Url];
    
    __unsafe_unretained ASIFormDataRequest *weakRequest = request;
    
    
    NSData *data =UIImageJPEGRepresentation(imageSelected, 1.0);
    
    
    [weakRequest setRequestMethod:@"POST"];
    
    [weakRequest setData:data withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:@"PhotoImg"];
    
    NSString *accessToken = [[NSUserDefaults standardUserDefaults]objectForKey:@"Token"];
    
    //{"token":"ZYHKGAUMH5IAHF4T5ZJWTT8GCTBAYMKI","PhotoImg":"test.pnpn","photo_type":"b"}
    
    [weakRequest setPostValue:accessToken forKey:@"token"];
    [weakRequest setPostValue:Side forKey:@"photo_type"];
    
    [weakRequest setCompletionBlock:^{
        NSData *response = [weakRequest responseData];
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];
        
        NSLog(@"JsonDict at UploadImage Service-%@",jsonDictionary);
        [self.delegate ImageUploadSuccess:jsonDictionary];
        
    }];
    
    [weakRequest setFailedBlock:^{
        NSError *error = [weakRequest error];
        NSLog(@"error:%@",error);
        [self.delegate ImageUploadFailure];
    }];
    
    [weakRequest startSynchronous];

}

-(void)FaceBookLoginByUser:(NSString *)EmailID
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/SocialLogin"];
    
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSDictionary *parameters =
    @{@"EmailId":EmailID,@"type":@"facebook"};
    
    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSError *error=nil;
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        
        NSLog(@"Succesful LoginByFaceBookSuccess**%@",dict);
        
        [self.delegate LoginByFaceBookSuccess:dict];
        
    }
     
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              [self.delegate LoginByFaceBookFailure];
          }];
    
 
}
-(void)GooglePlusLoginByUser:(NSString *)EmailID
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/SocialLogin"];
    
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSDictionary *parameters =
    @{@"EmailId":EmailID,@"type":@"gmail"};
    
    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSError *error=nil;
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        
        NSLog(@"Succesful LoginByGooglePlusSuccess**%@",dict);
        [self.delegate LoginByGooglePlusSuccess:dict];
    
    }
     
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              [self.delegate LoginByGooglePlusFailure];
          }];
}

-(void)ForgotPassword:(NSString *)EmailID
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/ForgotPassword"];
    
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSDictionary *parameters =
    @{@"email":EmailID};
    
    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSError *error=nil;
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        
        [self.delegate ForgotPasswordSuccess:dict];
        
        }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              
          }];
}

-(void)GetTermsAndConditions
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/GetTermsCondition"];
 
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager GET:Url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         
         NSError *error=nil;

          NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         
//         NSLog(@"dict value At GetTermsAndConditions-%@",dict);
         
         [self.delegate FetchTAndCSuccess:dict];
     }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             [self.delegate FetchTAndCFailure:[error localizedDescription]];
         }];
}

-(void)AcceptTermsAndConditions:(NSString *)token VersionId:(NSString *)VersionID
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/AcceptTermsCondition"];
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSDictionary *parameters =
    @{@"token":token,@"Version_Id":VersionID};

    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSError *error=nil;
         
         NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         NSLog(@"dict value At GetTermsAndConditions-%@",dict);
         [self.delegate AcceptTAndCSuccess];
              }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              [self.delegate AcceptTAndCFailure];
         }];
}
-(void)VerifyToken:(NSString *)Code
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/VerifyToken"];
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSDictionary *parameters =
    @{@"Verification_code":Code};
    
    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSError *error=nil;
         
         NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        // NSLog(@"dict value At -%@",dict);
         [self.delegate VerifyTokenSuccess:dict];
     }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              [self.delegate VerifyTokenfailure];
          }];

}

-(void)getCategoryList
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/CategoryList"];
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    
    [manager GET:Url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSError *error=nil;
         
         NSArray *Arraydict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
          NSLog(@"dict value At -%@",Arraydict);
         
         [self.delegate GetCategoryListSuccess:Arraydict];
     }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
             // NSLog(@"Failure for method getcatogoryList At Easy_Service");
              
              [self.delegate GetCategoryListFailure];

          }];
}

-(void)getProviderList:(NSString *)CatergoryId
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/ProviderList"];
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

    NSDictionary *parameters =@{@"CategoryId":CatergoryId};
    
    [manager GET:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSError *error=nil;
         
         NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         
         if ([[dict valueForKey:@"success"]isEqual:[NSNumber numberWithInt:1]])
         {
             [self.delegate FetchProviderListSuccess:[dict valueForKey:@"data"]];
         }
         else
         {
              [self.delegate FetchProviderListFailure];
         }
         
    
     }
     
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             // NSLog(@"Failure for method getcatogoryList At Easy_Service");
             [self.delegate FetchProviderListFailure];
            
             
         }];
}

-(void)CreateProvider:(NSString *)Token catogory:(NSString *)CategoryId Name:(NSString *)Name desc:(NSString *)Desp Email:(NSString *)Email Mobile:(NSString *)Mobile Faxnumber:(NSString *)Faxnumber
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/AddProvider"];
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSDictionary *parameters =@{@"Token":Token,@"CategoryId":CategoryId,@"Name":Name,@"Description":Desp,@"EmailId":Email,@"MobileNumber":Mobile,@"FaxNumber":Faxnumber};
    
    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSError *error=nil;
         
         NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         // NSLog(@"dict value At -%@",dict);
         [self.delegate CreateProviderSuccess:dict];
         
     }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              [self.delegate CreateProviderFailure];
          }];
    

}

-(void)AddProviderToMyProviders:(NSString *)Token catogory:(NSString *)CategoryId ProviderId:(NSString*)ProviderId
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/AddMyProviderList"];
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //{"Token":"ZYHKGAUMH5IAHF4T5ZJWTT8GCTBAYMKI","CategoryId":"4","ProviderId":"1"}
    NSDictionary *parameters =@{@"Token":Token,@"CategoryId":CategoryId,@"ProviderId":ProviderId};
    
    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSError *error=nil;
         
         NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
         
         
         // NSLog(@"dict value At -%@",dict);
         if ([[dict valueForKey:@"success"] isEqual:[NSNumber numberWithInt:1]])
         {
             [self.delegate addMyProvidersSuccess:dict];
         }
         else
         {
             [self.delegate addMyProvidersFailure:dict];
         }
         
     }
          failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        NSLog(@"%@",[error localizedDescription]);
          }];
    
    
}

-(void)GetUserDetails
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/GetUserDetail"];
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //{"Token":"ZYHKGAUMH5IAHF4T5ZJWTT8GCTBAYMKI","CategoryId":"4","ProviderId":"1"}
    
   
    NSDictionary *parameters =@{@"Token": [[NSUserDefaults standardUserDefaults] valueForKey:@"Token"]};
    
        [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSError *error=nil;
         
         NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
          NSLog(@"dict value At -%@",dict);
         
         
         if ([[dict valueForKey:@"success"] isEqual:[NSNumber numberWithInt:1]])
         {
             
             
             
             
             NSData *dataFromDict = [NSJSONSerialization dataWithJSONObject:[dict valueForKey:@"data"]
                                                                    options:kNilOptions
                                                                      error:&error];
             
             NSDictionary *dictFromData = [NSJSONSerialization JSONObjectWithData:dataFromDict
                                                                          options:NSJSONReadingAllowFragments
                                                                            error:&error];
             [self.delegate getUser:dictFromData];
         }
         else
         {
             [self.delegate failedGetUserDetails:@"Failed to get user details"];
         }
         
     }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              [self.delegate failedGetUserDetails:@"Failed to get user details"];
          }];
}
-(void)GetMyprovider
{
    NSString *Url =[BaseURL stringByAppendingString:@"/access/MyProviderList"];
    
    AFHTTPSessionManager *manager =
    [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //{"Token":"ZYHKGAUMH5IAHF4T5ZJWTT8GCTBAYMKI","CategoryId":"4","ProviderId":"1"}
    
    
    NSDictionary *parameters =@{@"Token": [[NSUserDefaults standardUserDefaults] valueForKey:@"Token"]};
    
    [manager POST:Url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSError *error=nil;
         
         NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        // NSLog(@"dict value At -%@",dict);
         
         
         if ([[dict valueForKey:@"success"] isEqual:[NSNumber numberWithInt:1]])
         {
             [self.delegate getMyProviderListSuccess:[dict valueForKey:@"data"]];
         }
         else
         {
             [self.delegate getMyProviderListFailure];
         }
         
     }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              [self.delegate getMyProviderListFailure];
          }];
}

@end
