#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface PPSSignatureView : GLKView

@property (assign, nonatomic) UIColor *strokeColor;
@property (assign, nonatomic) BOOL hasSignature;
-(UIImage *)imageWithView:(UIView *)view;

- (void)erase;

@end
