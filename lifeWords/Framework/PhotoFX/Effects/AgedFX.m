//
//  AgedFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "AgedFX.h"
#import "UIImage+Helpers.h"
#import "SepiaToneFilter.h"
#import "HardLightBlendModeFilter.h"

@implementation AgedFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge1.jpg"] resize:image.size]];
    
    SepiaToneFilter *sepiaToneFilter = [SepiaToneFilter filterWithInputIntensity:0.7493703f];
    HardLightBlendModeFilter *hardLightBlendModeFilter = 
                                        [HardLightBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];

    CIImage *outputImage = [hardLightBlendModeFilter applyFilter:[sepiaToneFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
