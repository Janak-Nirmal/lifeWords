//
//  PaperTossFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "PaperTossFX.h"
#import "UIImage+Helpers.h"
#import "ColorControlsFilter.h"
#import "OverlayBlendModeFilter.h"

@implementation PaperTossFX

+ (UIImage *)applyEffect:(UIImage *)image {
        
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"papertoss.png"] resize:image.size]];
    
    ColorControlsFilter *colorControlsFilter = 
    [ColorControlsFilter filterWithInputSaturation:1.650667f inputBrightness:0.0f inputContrast:1.0f];
    
    OverlayBlendModeFilter *overlayBlendModeFilter = 
    [OverlayBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    CIImage *outputImage = [overlayBlendModeFilter applyFilter:
                              [colorControlsFilter applyFilter:inputImage]];
    
    return [self renderImage:outputImage];
    
}

@end
