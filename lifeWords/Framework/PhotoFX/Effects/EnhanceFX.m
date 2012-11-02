//
//  EnhanceFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "EnhanceFX.h"
#import "EnhanceFilter.h"

@implementation EnhanceFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    EnhanceFilter *enhanceFilter = [EnhanceFilter filterWithRedEyeCorrection:NO];

    CIImage *outputImage = [enhanceFilter applyFilter:inputImage];
    return [self renderImage:outputImage];
}

@end