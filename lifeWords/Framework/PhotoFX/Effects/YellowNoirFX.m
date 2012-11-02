//
//  YellowNoirFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "YellowNoirFX.h"
#import "UIImage+Helpers.h"
#import "ColorMonochromeFilter.h"
#import "ColorControlsFilter.h"
#import "HardLightBlendModeFilter.h"

@implementation YellowNoirFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge5.png"] resize:image.size]];    
        
    ColorMonochromeFilter *colorMonochromeFilter = [ColorMonochromeFilter 
                                                    filterWithInputColor:[CIColor colorWithRed:1 green:0.997229 blue:0.469835 alpha:1]inputIntensity:1.0f];
    
    ColorControlsFilter *colorControlsFilter = [ColorControlsFilter filterWithInputSaturation:2.0f 
                                                                              inputBrightness:0.0f 
                                                                                inputContrast:1.189333f];
    
    HardLightBlendModeFilter *hardLightBlendModeFilter = [HardLightBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];

    
    CIImage *outputImage = [hardLightBlendModeFilter applyFilter:
                            [colorControlsFilter applyFilter:
                             [colorMonochromeFilter applyFilter:inputImage]]];
    
    return [self renderImage:outputImage];
    
}


@end
