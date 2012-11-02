//
//  HalftoneDarkFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "HalftoneDarkFX.h"
#import "UIImage+Helpers.h"
#import "ColorControlsFilter.h"
#import "ColorBurnBlendModeFilter.h"

@implementation HalftoneDarkFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *dotsImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"dots.png"] tile:image.size]];
    
    ColorControlsFilter *colorControlsFilter = 
    [ColorControlsFilter filterWithInputSaturation:1.938667f inputBrightness:0.0f inputContrast:1.0f];
        
    ColorBurnBlendModeFilter *colorBurnBlendMode = 
    [ColorBurnBlendModeFilter filterWithInputBackgroundImage:[colorControlsFilter applyFilter:inputImage]];
    
    CIImage *outputImage = [colorBurnBlendMode applyFilter:dotsImage];
    
    return [self renderImage:outputImage];
    
}

@end
