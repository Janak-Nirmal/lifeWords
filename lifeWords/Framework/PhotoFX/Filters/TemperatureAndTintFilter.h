//
//  TemperatureAndTintFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface TemperatureAndTintFilter : Filter

+ (TemperatureAndTintFilter *)filterWithInputNeutral:(CIVector *)inputNeutral inputTargetNeutral:(CIVector *)inputTargetNeutral;

@end
