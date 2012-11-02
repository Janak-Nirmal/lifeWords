//
//  AvatarFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "AvatarFX.h"
#import "ColorMonochromeFilter.h"
#import "ColorControlsFilter.h"
#import "TemperatureAndTintFilter.h"

@implementation AvatarFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    ColorControlsFilter *colorControlsFilter = 
    [ColorControlsFilter filterWithInputSaturation:1.586667f inputBrightness:0.0f inputContrast:1.0f];
    
    ColorMonochromeFilter *colorMonochromeFilter =
    [ColorMonochromeFilter filterWithInputColor:[CIColor colorWithRed:0.504222 green:0.965483 blue:0.517788 alpha:1] 
                                 inputIntensity:0.679054];
    
    TemperatureAndTintFilter *temperatureAndTintFilter =
    [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:6500] 
                                  inputTargetNeutral:[CIVector vectorWithX:18816.1]];
    
    CIImage *outputImage = [colorControlsFilter applyFilter:
                            [colorMonochromeFilter applyFilter:
                             [temperatureAndTintFilter applyFilter:inputImage]]];
    
    return [self renderImage:outputImage];
}

@end
