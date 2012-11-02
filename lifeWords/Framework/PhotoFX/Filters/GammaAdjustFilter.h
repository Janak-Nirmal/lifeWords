//
//  GammaAdjustFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface GammaAdjustFilter : Filter

+ (GammaAdjustFilter *) filterWithInputPower:(CGFloat)inputPower;

@end
