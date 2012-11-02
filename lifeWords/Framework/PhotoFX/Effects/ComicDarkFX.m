//
//  ComicDarkFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "ComicDarkFX.h"
#import "UIImage+Helpers.h"
#import "TemperatureAndTintFilter.h"
#import "ColorControlsFilter.h"
#import "ExposureAdjustFilter.h"

@implementation ComicDarkFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    TemperatureAndTintFilter *temperatureAndTintFilter = 
        [TemperatureAndTintFilter filterWithInputNeutral:[CIVector vectorWithX:20000] inputTargetNeutral:[CIVector vectorWithX:0]];
    
    ColorControlsFilter *colorControlsFilter =
        [ColorControlsFilter filterWithInputSaturation:1.0f inputBrightness:0.0f inputContrast:1.797333f];
    
    ExposureAdjustFilter *exposureAdjustFilter = [ExposureAdjustFilter filterWithInputEV:3.47607f];
    
    CIImage *outputImage = [exposureAdjustFilter applyFilter:
                            [colorControlsFilter applyFilter:
                             [temperatureAndTintFilter applyFilter:
                              [temperatureAndTintFilter applyFilter:inputImage]]]];
    return [self renderImage:outputImage];
}

@end
