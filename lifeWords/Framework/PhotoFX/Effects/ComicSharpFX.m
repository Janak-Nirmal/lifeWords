//
//  ComicSharpFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "ComicSharpFX.h"
#import "ColorControlsFilter.h"
#import "ExposureAdjustFilter.h"

@implementation ComicSharpFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];

    ColorControlsFilter *colorControlsFilter =
        [ColorControlsFilter filterWithInputSaturation:2.0f inputBrightness:0.0f inputContrast:1.285333f];
    ExposureAdjustFilter *exposureAdjustFilter = [ExposureAdjustFilter filterWithInputEV:10.0f];
    
    CIImage *outputImage = [exposureAdjustFilter applyFilter:
                            [colorControlsFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
