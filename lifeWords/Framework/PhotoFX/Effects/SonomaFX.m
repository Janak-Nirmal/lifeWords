//
//  SonomaFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "SonomaFX.h"
#import "ColorControlsFilter.h"
#import "TemperatureAndTintFilter.h"
#import "UIImage+Helpers.h"

@implementation SonomaFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    ColorControlsFilter *colorControlsFilter = 
    [ColorControlsFilter filterWithInputSaturation:1.597333f inputBrightness:0.0f inputContrast:1.146667f];
    
    TemperatureAndTintFilter *temperatureAndTintFilter =
    [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:528.967] 
                                  inputTargetNeutral:[CIVector vectorWithX:20000]]; 
    
    CIImage *outputImage = [temperatureAndTintFilter applyFilter:[colorControlsFilter applyFilter:inputImage]];
    
    return [self renderImage:outputImage];
    
}

@end
