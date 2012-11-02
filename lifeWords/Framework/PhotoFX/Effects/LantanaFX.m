//
//  LantanaFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "LantanaFX.h"
#import "UIImage+Helpers.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "HueAdjustFilter.h"

@implementation LantanaFX

+ (UIImage *)applyEffect:(UIImage *)image {

    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    
    HueAdjustFilter *hueAdjustFilter = [HueAdjustFilter filterWithInputAngle:1.755869f];
        
    CIImage *outputImage = [hueAdjustFilter applyFilter:inputImage];
    return [self renderImage:outputImage];
    
}

@end
