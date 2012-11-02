//
//  NapaFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "NapaFX.h"
#import "UIImage+Helpers.h"
#import "HardLightBlendModeFilter.h"
#import "ColorControlsFilter.h"

@implementation NapaFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge5.png"] resize:image.size]];    
    
    HardLightBlendModeFilter *hardLightBlendModeFilter = [HardLightBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    ColorControlsFilter *colorControlsFilter = [ColorControlsFilter filterWithInputSaturation:1.613333f 
                                                                              inputBrightness:0.0f 
                                                                                inputContrast:1.0f];
    
    CIImage *outputImage = [colorControlsFilter applyFilter:
                             [hardLightBlendModeFilter applyFilter:inputImage]];
    
    return [self renderImage:outputImage];

}

@end
