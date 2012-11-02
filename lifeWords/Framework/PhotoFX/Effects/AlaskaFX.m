//
//  AlaskaFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "AlaskaFX.h"
#import "UIImage+Helpers.h"
#import "HardLightBlendModeFilter.h"
#import "TemperatureAndTintFilter.h"

@implementation AlaskaFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge5.png"] resize:image.size]];
    
    HardLightBlendModeFilter *hardLightBlendModeFilter = 
        [HardLightBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    TemperatureAndTintFilter *temperatureAndTintFilter =
        [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:1284.63] 
                                      inputTargetNeutral:[CIVector vectorWithX:16901.8]];
    
    CIImage *outputImage = [temperatureAndTintFilter applyFilter:[hardLightBlendModeFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
