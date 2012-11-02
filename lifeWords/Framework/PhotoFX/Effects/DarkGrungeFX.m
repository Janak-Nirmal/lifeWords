//
//  DarkGrungeFX.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "DarkGrungeFX.h"
#import "UIImage+Helpers.h"
#import "HardLightBlendModeFilter.h"

@implementation DarkGrungeFX

+ (UIImage *)applyEffect:(UIImage *)image {
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIImage *inputBackgroundImage = [[CIImage alloc] initWithImage:[[UIImage imageNamed:@"grunge3.png"] resize:image.size]];
    
    HardLightBlendModeFilter *hardLightBlendModeFilter = [HardLightBlendModeFilter filterWithInputBackgroundImage:inputBackgroundImage];
    
    CIImage *outputImage = [hardLightBlendModeFilter applyFilter:inputImage];
    return [self renderImage:outputImage];
}

@end
