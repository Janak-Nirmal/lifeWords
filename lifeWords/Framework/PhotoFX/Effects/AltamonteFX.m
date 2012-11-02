//
//  AltamonteFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "AltamonteFX.h"
#import "UIImage+Helpers.h"
#import "ColorControlsFilter.h"
#import "HueAdjustFilter.h"

@implementation AltamonteFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    ColorControlsFilter *colorControlsFilter = 
        [ColorControlsFilter filterWithInputSaturation:1.901333f inputBrightness:0.0f inputContrast:1.0f];
    
    HueAdjustFilter *hueAdjustFilter = [HueAdjustFilter filterWithInputAngle:2.151335f];
    
    CIImage *outputImage = [hueAdjustFilter applyFilter:[colorControlsFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
