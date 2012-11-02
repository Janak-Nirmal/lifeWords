//
//  GrungeRaysSapiaFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "GrungeRaysSapiaFX.h"
#import "UIImage+Helpers.h"
#import "HardLightBlendModeFilter.h"
#import "SepiaToneFilter.h"

@implementation GrungeRaysSapiaFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge6.png"] resize:image.size]];
    
    SepiaToneFilter *sepiaToneFilter = [SepiaToneFilter filterWithInputIntensity:0.9861461f];
    
    HardLightBlendModeFilter *hardLightBlendModeFilter = 
    [HardLightBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    CIImage *outputImage = [hardLightBlendModeFilter applyFilter:[sepiaToneFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
    
}

@end
