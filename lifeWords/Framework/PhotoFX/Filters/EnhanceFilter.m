//
//  EnhanceFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "EnhanceFilter.h"

@implementation EnhanceFilter

@synthesize redEyeCorrection;

+ (EnhanceFilter *)filterWithRedEyeCorrection:(BOOL)redEyeCorrection {
    EnhanceFilter *ef = [[EnhanceFilter alloc] init];

    ef.redEyeCorrection = redEyeCorrection;
    
    return ef;
}

- (CIImage *)applyFilter:(CIImage *)inputImage {
    NSArray* suggestions = nil;
    
    if (!redEyeCorrection)
        suggestions = [inputImage autoAdjustmentFiltersWithOptions:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:kCIImageAutoAdjustRedEye]];
    else
        suggestions = [inputImage autoAdjustmentFilters];

    for (CIFilter* ciFilter in suggestions) {
        [ciFilter setValue:inputImage forKey:kCIInputImageKey];
        inputImage = ciFilter.outputImage;
    }
    
    return inputImage;
}

@end
