//
//  selectBackPhotoViewController.m
//  EasyPost
//
//  Created by Bifortis on 4/13/15.
//  Copyright (c) 2015 Narek Gevorgyan. All rights reserved.
//

#import "selectBackPhotoViewController.h"

@interface selectBackPhotoViewController ()

@end

@implementation selectBackPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0://camera button
            
        case 1://photo button
            [self presentImagePickerUsingCamera:(buttonIndex==0)];
            break;
            
    }
}

- (void)presentImagePickerUsingCamera:(BOOL)useCamera
{
    UIImagePickerController *cameraUI=[[UIImagePickerController alloc]init];
    cameraUI.sourceType=( useCamera ? UIImagePickerControllerSourceTypeCamera
                         : UIImagePickerControllerSourceTypePhotoLibrary );
    cameraUI.mediaTypes = @[(NSString*)kUTTypeImage];
    cameraUI.delegate = self;
    [self presentViewController:cameraUI animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString*)kUTTypeImage])
    {
        self.imageVwBack.image = info[UIImagePickerControllerEditedImage];
        if (self.imageVwBack.image==nil)
            self.imageVwBack.image = info[UIImagePickerControllerOriginalImage];
        
        if (picker.sourceType==UIImagePickerControllerSourceTypeCamera)
            UIImageWriteToSavedPhotosAlbum(self.imageVwBack.image,nil,nil,nil);
        
        CGImageRef coreGraphicsImage = self.imageVwBack.image.CGImage;
        CGFloat height = CGImageGetHeight(coreGraphicsImage);
        CGFloat width = CGImageGetWidth(coreGraphicsImage);
        CGRect crop;
        if (height>width)
        {
            crop.size.height = crop.size.width = width;
            crop.origin.x = 0;
            crop.origin.y = floorf((height-width)/2);
        }
        else {
            crop.size.height = crop.size.width = height;
            crop.origin.y = 0;
            crop.origin.x = floorf((width-height)/2);
        }
        
        CGImageRef croppedImage = CGImageCreateWithImageInRect(coreGraphicsImage,crop);
        
        self.imageVwBack.image = [UIImage imageWithCGImage:croppedImage
                                                                  scale:MAX(crop.size.height/512,1.0)
                                                            orientation:self.imageVwBack.image.imageOrientation];
        
        
        CGImageRelease(croppedImage);
        
        self.btnDone.hidden=NO;
    }
    
    [self dismissImagePicker];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissImagePicker];
}

- (void)dismissImagePicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selectImageBack:(id)sender {
    BOOL hasPhotoLibrary=[UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    
    BOOL hasCamera=[UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    
    if (!hasPhotoLibrary && !hasCamera) {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
    }
    
    if (hasCamera && hasPhotoLibrary) {
       
        UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate
                                                                      :self
                                                     cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a picture",@"Choose a photo", nil];
        [actionSheet showInView:self.view];
        return;
    }
    

}
- (IBAction)btnDoneForBackImage:(id)sender {
   
    EasyPost_Service *service=[[EasyPost_Service alloc]init];
    service.delegate=self;
    [service sendIdentificationImage:self.imageVwBack.image Side:@"b"];
    
    
}

- (IBAction)btnSkip:(id)sender {
    
    [self performSegueWithIdentifier:@"SignatureScrn" sender:self];
}
-(void)ImageUploadSuccess:(NSDictionary *)ResponseForIDimage
{
    NSDictionary *ParseForImageName=[[NSDictionary alloc]initWithDictionary:[ResponseForIDimage valueForKey:@"Data"]];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[ParseForImageName valueForKey:@"msg"] forKey:@"ImageFileName"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                    message:@"Identifiaction Image uploaded Successfully"
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    alert.tag = 5;
    [alert show];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==5) {
        [self performSegueWithIdentifier:@"SignatureScrn" sender:self];
    }
}

-(void)ImageUploadFailure
{
    NSLog(@"ImageUploadFailure AT selectPhotoViewController");
}

@end
