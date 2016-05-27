//
//  HelperAndConstants.m
//  EasyPost
//
//  Created by Bifortis on 3/24/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "HelperAndConstants.h" 

@implementation HelperAndConstants


-(UIImage *)getImage :(NSString *)imageName andIsUserDp:(BOOL) dp andUserId:(NSString*)UserId;
{
    NSString * url = nil;
    if(dp)
    {
//        url = USER_DP_URL;
//        url=[NSString stringWithFormat:@"%@%@/%@",url,UserId,imageName];
//        
    }
    else
    {
        url =SignatureURL;
        url=[url stringByAppendingString:imageName];
    }
    
    
    //url = [url stringByAppendingString:imageName];
    
    NSArray *dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPath objectAtIndex:0];
    NSString *photoPath = [docsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSData * imageData = nil;
    UIImage *image = nil;
    
    if ([fileManager fileExistsAtPath:photoPath]){
        imageData = [[NSData alloc] initWithContentsOfFile:photoPath];
        image = [UIImage imageWithData:imageData];
        NSLog(@"Loading from file : %@",photoPath);
    }
    else{
        NSLog(@"Loading from url : %@",url);
        imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:url]];
        float imageCompression = 0.5;
        
        image = [UIImage imageWithData:imageData];
        
        imageData = UIImageJPEGRepresentation(image, imageCompression);
        
        //save the image
        if(![imageData writeToFile:photoPath atomically:YES]){
            NSLog(@"Failed to save image");
        }
        else
            NSLog(@"Image saved successfully");
    }
    return image;
}
@end
