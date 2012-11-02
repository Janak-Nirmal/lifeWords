//
//  BlackAndWhiteLuminoFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "BlackAndWhiteLuminoFX.h"
#import "UIImage+Helpers.h"
#import "GammaAdjustFilter.h"
#import "LuminosityBlendModeFilter.h"

@implementation BlackAndWhiteLuminoFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge1.jpg"] resize:image.size]];
    
    GammaAdjustFilter *gammaAdjustFilter = 
        [GammaAdjustFilter filterWithInputPower:1.5f];
    
    LuminosityBlendModeFilter *luminosityBlendModeFilter = 
        [LuminosityBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];

    CIImage *outputImage = [luminosityBlendModeFilter applyFilter:[gammaAdjustFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
