//
//  MarsFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "MarsFX.h"
#import "ColorMonochromeFilter.h"

@implementation MarsFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    ColorMonochromeFilter *colorMonochromeFilter =
    [ColorMonochromeFilter filterWithInputColor:[CIColor colorWithRed:1 green:0.43771 blue:0 alpha:1] 
                                 inputIntensity:1.0f];
    
    
    CIImage *outputImage = [colorMonochromeFilter applyFilter:inputImage];
    return [self renderImage:outputImage];
}


@end
