//
//  DuskFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "DuskFX.h"
#import "TemperatureAndTintFilter.h"

@implementation DuskFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    TemperatureAndTintFilter *temperatureAndTintFilter = [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:20000]
                                                                                        inputTargetNeutral:[CIVector vectorWithX:0]];

    CIImage *outputImage = [temperatureAndTintFilter applyFilter:
                            [temperatureAndTintFilter applyFilter:
                             [temperatureAndTintFilter applyFilter:inputImage]]];
    return [self renderImage:outputImage];
}

@end
