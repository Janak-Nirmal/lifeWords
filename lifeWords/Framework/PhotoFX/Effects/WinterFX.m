//
//  WinterFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "WinterFX.h"
#import "UIImage+Helpers.h"
#import "TemperatureAndTintFilter.h"

@implementation WinterFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
            
    TemperatureAndTintFilter *temperatureAndTintFilter1 =
    [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:0] 
                                  inputTargetNeutral:[CIVector vectorWithX:20000]]; 

    TemperatureAndTintFilter *temperatureAndTintFilter2 =
    [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:0] 
                                  inputTargetNeutral:[CIVector vectorWithX:20000]]; 
    
    CIImage *outputImage = [temperatureAndTintFilter2 applyFilter:[temperatureAndTintFilter1 applyFilter:inputImage]];
    
    return [self renderImage:outputImage];
    
}

@end
