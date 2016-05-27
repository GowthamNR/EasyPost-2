//
//  EasyPost_Service.h
//  EasyPost
//
//  Created by Bifortis on 3/20/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#define BaseURL @"http://119.9.77.8:8080/ezpost/apis/index.php/user"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#define SignatureURL @"http://119.9.77.8:8080/ezpost/apis/uploads/users/signature/"
#define ImageUrl @"http://119.9.77.8:8080/ezpost/apis/uploads/users/photos/"


@protocol EZPostService <NSObject>

@optional

-(void)SucessForUniqueEmailID:(NSString *)success;
-(void)FailedForUniqueEmailID:(NSString *)Failure;


-(void)SuccessForUniqueUserID:(NSString *)success;
-(void)FailedForUniqueUserID:(NSString *)Failure;

-(void)SuccessForUniqueMobileNum:(NSString *)success;
-(void)FailedForUniqueMobileNum:(NSString *)Failure;

-(void)SuccessForUserRegistration:(NSDictionary *)ResponseAfterRegister;
-(void)FailedToRegisterUser;

-(void)LoginSuccess:(NSDictionary *)ResponseAfterLogin;
-(void)LoginFailure;

-(void)GettingDataFromGoogleSuccess:(NSDictionary *)ResponseFromGmail;
-(void)GettingDataFromGoogleFailure;


-(void)LoginByFaceBookSuccess:(NSDictionary *)ResponseFromServer;
-(void)LoginByFaceBookFailure;

-(void)LoginByGooglePlusSuccess:(NSDictionary *)responseFromServer;
-(void)LoginByGooglePlusFailure;

-(void)ForgotPasswordSuccess:(NSDictionary *)ResponseForForgotPassword;
-(void)ForgotPasswordFailure:(NSDictionary *)Desp;

-(void)SignatureUploadedSuccess:(NSDictionary *)ResponseForSignature;
-(void)SignatureUploadedFailure;

-(void)ImageUploadSuccess:(NSDictionary *)ResponseForIDimage;
-(void)ImageUploadFailure;

-(void)FetchTAndCSuccess:(NSDictionary *)ResponseForTAndC;
-(void)FetchTAndCFailure:(NSString *)ErrorForFailure;

-(void)AcceptTAndCSuccess;
-(void)AcceptTAndCFailure;

-(void)VerifyTokenSuccess:(NSDictionary *)Dict;
-(void)VerifyTokenfailure;

-(void)GetCategoryListSuccess:(NSArray *)List;
-(void)GetCategoryListFailure;

-(void)FetchProviderListSuccess:(NSDictionary *)Dict;
-(void)FetchProviderListFailure;



-(void)CreateProviderSuccess:(NSDictionary *)Dict;
-(void)CreateProviderFailure;

-(void)getUser:(NSDictionary*)dict;
-(void)failedGetUserDetails:(NSString*)msg;

-(void)addMyProvidersSuccess:(NSDictionary *)dict;
-(void)addMyProvidersFailure:(NSDictionary *)dict;

-(void)getMyProviderListSuccess:(NSDictionary *)dict;
-(void)getMyProviderListFailure;
@end


@interface EasyPost_Service : NSObject
-(void)GettingDataFromGoogleUsingAccessToken:(NSString *)AccessToken;
-(void)checkingTheEmailUnique:(NSString *)emailId;
-(void)checkingTheUserIDUnique:(NSString *)Userid;
-(void)checkingTheMobileNumUnique:(NSString *)MobileNumber;

-(void)RegisterTheUser:(NSString *)Name  EmailID:(NSString *)emailID Password:(NSString *)Password Mobilenum:(NSString *)MobileNum LastName:(NSString*)Lname telephone:(NSString *)TelNum;
-(void)LoginUser :(NSString *)UserEmail Password:(NSString *)PassWord;
-(void)FaceBookLoginByUser:(NSString *)EmailID;
-(void)GooglePlusLoginByUser:(NSString *)EmailID;
-(void)ForgotPassword:(NSString *)EmailID;

-(void)sendIdentificationImage:(UIImage *)imageSelected Side:(NSString *)Side;

-(void)UploadSignature:(UIImage *)Signature;
-(void)GetTermsAndConditions;
-(void)AcceptTermsAndConditions:(NSString *)token VersionId:(NSString *)VersionID;
-(void)VerifyToken:(NSString *)Code;
-(void)getCategoryList;
-(void)CreateProvider:(NSString *)Token catogory:(NSString *)CategoryId Name:(NSString *)Name desc:(NSString *)Desp Email:(NSString *)Email Mobile:(NSString *)Mobile Faxnumber:(NSString *)Faxnumber;
-(void)getProviderList:(NSString *)CatergoryId;


-(void)AddProviderToMyProviders:(NSString *)Token catogory:(NSString *)CategoryId ProviderId:(NSString*)ProviderId;
//Registering Delegate
-(void)GetUserDetails;
-(void)GetMyprovider;
@property(nonatomic,weak)id<EZPostService> delegate;



@end
