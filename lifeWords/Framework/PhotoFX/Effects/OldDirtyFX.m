//
//  OldDirtyFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "OldDirtyFX.h"
#import "UIImage+Helpers.h"
#import "SepiaToneFilter.h"
#import "MinimumCompositingFilter.h"


@implementation OldDirtyFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge3.png"] resize:image.size]];
    
    MinimumCompositingFilter *minimumCompositingFilter = 
    [MinimumCompositingFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    SepiaToneFilter *sepiaToneFilter = [SepiaToneFilter filterWithInputIntensity:0.7493703f];
    
    CIImage *outputImage = [sepiaToneFilter applyFilter:[minimumCompositingFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
    
}

@end
