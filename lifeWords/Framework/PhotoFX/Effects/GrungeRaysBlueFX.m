//
//  GrungeRaysBlueFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "GrungeRaysBlueFX.h"
#import "UIImage+Helpers.h"
#import "DarkenBlendModeFilter.h"
#import "ColorMonochromeFilter.h"

@implementation GrungeRaysBlueFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge6.png"] resize:image.size]];
    
    DarkenBlendModeFilter *darkenBlendModeFilter = 
        [DarkenBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    ColorMonochromeFilter *colorMonochromeFilter = 
        [ColorMonochromeFilter filterWithInputColor:[CIColor colorWithRed:0 green:0 blue:0.898175 alpha:1] 
                                     inputIntensity:1.0f];
    
    CIImage *outputImage = [colorMonochromeFilter applyFilter:
                             [darkenBlendModeFilter applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
