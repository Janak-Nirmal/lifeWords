//
//  NapaFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "VividFX.h"
#import "ColorControlsFilter.h"

@implementation VividFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];

    ColorControlsFilter *colorControlsFilter = [ColorControlsFilter filterWithInputSaturation:1.673f 
                                                                              inputBrightness:0.0f 
                                                                                inputContrast:1.0f];
    
    CIImage *outputImage = [colorControlsFilter applyFilter:inputImage];
    
    return [self renderImage:outputImage];
}

@end
