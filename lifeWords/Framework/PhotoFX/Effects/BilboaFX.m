//
//  BilboaFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "BilboaFX.h"
#import "VibranceFilter.h"

@implementation BilboaFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    VibranceFilter *vibranceFilter1 = [VibranceFilter filterWithInputAmount:0.8602015f];
    VibranceFilter *vibranceFilter2 = [VibranceFilter filterWithInputAmount:0.8173804f];
    
    CIImage *outputImage = [vibranceFilter2 applyFilter:[vibranceFilter1 applyFilter:inputImage]];
    return [self renderImage:outputImage];
}

@end
