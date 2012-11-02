//
//  SenibelFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "SenibelFX.h"
#import "HueAdjustFilter.h"

@implementation SenibelFX

+ (UIImage *)applyEffect:(UIImage *)image {
    
    CIImage *inputImage = [[CIImage alloc] initWithImage:image]; 
    
    HueAdjustFilter *hueAdjustFilter = [HueAdjustFilter filterWithInputAngle:-3.14f];
    
    CIImage *outputImage = [hueAdjustFilter applyFilter:inputImage];
    
    return [self renderImage:outputImage];
}

@end
