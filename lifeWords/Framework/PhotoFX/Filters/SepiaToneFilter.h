//
//  SepiaToneFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface SepiaToneFilter : Filter

+ (SepiaToneFilter *)filterWithInputIntensity:(CGFloat)inputIntensity;

@end
