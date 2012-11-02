//
//  HalftoneSharpFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "HalftoneSharpFX.h"
#import "UIImage+Helpers.h"
#import "ColorControlsFilter.h"
#import "ColorDodgeBlendModeFilter.h"
#import "DarkenBlendModeFilter.h"

@implementation HalftoneSharpFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge4.jpeg"] resize:image.size]];
    CIImage *dotsImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"dots.png"] tile:image.size]];
    
    ColorControlsFilter *colorControlsFilter = 
        [ColorControlsFilter filterWithInputSaturation:1.938667f inputBrightness:0.0f inputContrast:1.0f];
   
    DarkenBlendModeFilter *darkenBlendModeFilter = 
        [DarkenBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    ColorDodgeBlendModeFilter *colorDodgeBlendMode = 
        [ColorDodgeBlendModeFilter filterWithInputBackgroundImage:[colorControlsFilter applyFilter:inputImage]];

    CIImage *outputImage = [darkenBlendModeFilter applyFilter:[colorDodgeBlendMode applyFilter:dotsImage]];
    
    return [self renderImage:outputImage];
    
}

@end
