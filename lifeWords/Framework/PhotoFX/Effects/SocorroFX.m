//
//  SocorroFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "SocorroFX.h"
#import "ColorControlsFilter.h"
#import "TemperatureAndTintFilter.h"
#import "UIImage+Helpers.h"

@implementation SocorroFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    ColorControlsFilter *colorControlsFilter = 
    [ColorControlsFilter filterWithInputSaturation:0.2586667f inputBrightness:0.0f inputContrast:1.0f];
    
    CIImage *outputImage = [colorControlsFilter applyFilter:inputImage];
    
    return [self renderImage:outputImage];

}

@end
