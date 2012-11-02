//
//  SepiaToneFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CISepiaTone"

#import "SepiaToneFilter.h"

@implementation SepiaToneFilter 

+ (SepiaToneFilter *)filterWithInputIntensity:(CGFloat)inputIntensity {
    SepiaToneFilter *stf = [[SepiaToneFilter alloc] init];

    stf.filter = [CIFilter filterWithName:kFilterName];
    [stf.filter setDefaults];
    [stf.filter setValue:[NSNumber numberWithFloat:inputIntensity] forKey:@"inputIntensity"];

    return stf;
}

@end
