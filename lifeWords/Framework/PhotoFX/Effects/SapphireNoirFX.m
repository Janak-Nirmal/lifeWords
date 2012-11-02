//
//  SapphireNoirFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "SapphireNoirFX.h"
#import "UIImage+Helpers.h"
#import "ColorMonochromeFilter.h"
#import "HardLightBlendModeFilter.h"

@implementation SapphireNoirFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge5.png"] resize:image.size]];    
    
    ColorMonochromeFilter *colorMonochromeFilter = [ColorMonochromeFilter filterWithInputColor:[CIColor colorWithRed:1 green:0.467158 blue:0.483221 alpha:1] inputIntensity:1.0f];
        
    HardLightBlendModeFilter *hardLightBlendModeFilter = [HardLightBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    
    CIImage *outputImage = [colorMonochromeFilter applyFilter:[hardLightBlendModeFilter applyFilter:inputImage]];
    
    return [self renderImage:outputImage];

}


@end
