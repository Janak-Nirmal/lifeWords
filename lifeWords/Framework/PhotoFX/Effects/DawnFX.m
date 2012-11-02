//
//  DawnFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "DawnFX.h"
#import "TemperatureAndTintFilter.h"

@implementation DawnFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    TemperatureAndTintFilter *temperatureAndTintFilter1 = [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:0.0f]
                                                                                        inputTargetNeutral:[CIVector vectorWithX:15995]];
    
    TemperatureAndTintFilter *temperatureAndTintFilter2 = [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:0.0f]
                                                                                        inputTargetNeutral:[CIVector vectorWithX:15541]];
    
    TemperatureAndTintFilter *temperatureAndTintFilter3 = [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:1133.5f]
                                                                                        inputTargetNeutral:[CIVector vectorWithX:17808]];
    
    CIImage *outputImage = [temperatureAndTintFilter3 applyFilter:
                            [temperatureAndTintFilter2 applyFilter:
                             [temperatureAndTintFilter1 applyFilter:inputImage]]];
    return [self renderImage:outputImage];
}

@end
