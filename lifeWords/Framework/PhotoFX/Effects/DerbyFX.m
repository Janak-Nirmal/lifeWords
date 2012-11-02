//
//  DerbyFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "DerbyFX.h"
#import "ColorControlsFilter.h"
#import "ExposureAdjustFilter.h"

@implementation DerbyFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    ColorControlsFilter *colorControlsFilter =
        [ColorControlsFilter filterWithInputSaturation:1.0f inputBrightness:0.0f inputContrast:1.157333f];
    ExposureAdjustFilter *exposureAdjustFilter = [ExposureAdjustFilter filterWithInputEV:2.468513f];
    
    CIImage *outputImage = [exposureAdjustFilter applyFilter:
                            [colorControlsFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
