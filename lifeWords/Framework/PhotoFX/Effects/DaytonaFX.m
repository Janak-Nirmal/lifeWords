//
//  DaytonaFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "DaytonaFX.h"
#import "ColorControlsFilter.h"
#import "SepiaToneFilter.h"

@implementation DaytonaFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    ColorControlsFilter *colorControlsFilter =
        [ColorControlsFilter filterWithInputSaturation:0.2586667f inputBrightness:0.0f inputContrast:1.0f];
    SepiaToneFilter *sepiaToneFilter = [SepiaToneFilter filterWithInputIntensity:0.5125945f];
    
    CIImage *outputImage = [sepiaToneFilter applyFilter:
                            [colorControlsFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
