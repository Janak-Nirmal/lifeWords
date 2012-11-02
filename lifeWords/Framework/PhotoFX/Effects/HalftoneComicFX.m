//
//  HalftoneComicFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "HalftoneComicFX.h"
#import "UIImage+Helpers.h"
#import "ColorControlsFilter.h"
#import "ExposureAdjustFilter.h"
#import "ColorDodgeBlendModeFilter.h"


@implementation HalftoneComicFX

+ (UIImage *)applyEffect:(UIImage *)image {
 
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *dotsImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"dots.png"] tile:image.size]];
    
    ColorControlsFilter *colorControlsFilter = 
        [ColorControlsFilter filterWithInputSaturation:2.0f inputBrightness:0.0f inputContrast:1.274667f];
    
    ExposureAdjustFilter *exposureAdjustFilter = [ExposureAdjustFilter filterWithInputEV:1.813602f];
    
    ColorDodgeBlendModeFilter *colorDodgeBlendMode = 
        [ColorDodgeBlendModeFilter filterWithInputBackgroundImage:
                                [exposureAdjustFilter applyFilter:
                                [colorControlsFilter applyFilter:inputImage]]];
    
    CIImage *outputImage = [colorDodgeBlendMode applyFilter:dotsImage];
    
    return [self renderImage:outputImage];
}

@end
