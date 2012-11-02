//
//  MarineFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "MarineFX.h"
#import "HueAdjustFilter.h"
#import "ColorControlsFilter.h"

@implementation MarineFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    HueAdjustFilter *hueAdjustFilter = [HueAdjustFilter filterWithInputAngle:3.14f];
    
    ColorControlsFilter *colorControlsFilter = 
    [ColorControlsFilter filterWithInputSaturation:1.517333f inputBrightness:0.0f inputContrast:1.0f];
    
    CIImage *outputImage = [colorControlsFilter applyFilter:[hueAdjustFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
    
}

@end
