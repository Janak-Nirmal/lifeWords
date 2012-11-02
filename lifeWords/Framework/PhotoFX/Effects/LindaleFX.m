//
//  LindaleFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "LindaleFX.h"
#import "TemperatureAndTintFilter.h"
#import "ColorControlsFilter.h"

@implementation LindaleFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    TemperatureAndTintFilter *temperatureAndTintFilter1 =
    [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:17707.8] 
                                  inputTargetNeutral:[CIVector vectorWithX:1536.52]]; 
    
    TemperatureAndTintFilter *temperatureAndTintFilter2 =
    [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:17103.3] 
                                  inputTargetNeutral:[CIVector vectorWithX:579.345]]; 
    
    ColorControlsFilter *colorControlsFilter = 
    [ColorControlsFilter filterWithInputSaturation:1.485333f inputBrightness:0.0f inputContrast:1.0f];
    
    CIImage *outputImage = [colorControlsFilter applyFilter:[temperatureAndTintFilter2 applyFilter:[temperatureAndTintFilter1 applyFilter:inputImage]]];
    
    return [self renderImage:outputImage];
    
}

@end
