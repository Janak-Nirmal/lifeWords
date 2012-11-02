//
//  BlackAndWhiteGrainedFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "BlackAndWhiteGrainedFX.h"
#import "UIImage+Helpers.h"
#import "ColorControlsFilter.h"
#import "HardLightBlendModeFilter.h"

@implementation BlackAndWhiteGrainedFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge1.jpg"] resize:image.size]];
    
    ColorControlsFilter *colorControlsFilter = 
        [ColorControlsFilter filterWithInputSaturation:0.08266667f inputBrightness:0.0f inputContrast:1.0f];
    
    HardLightBlendModeFilter *hardLightBlendModeFilter = 
        [HardLightBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    CIImage *outputImage = [hardLightBlendModeFilter applyFilter:[colorControlsFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
