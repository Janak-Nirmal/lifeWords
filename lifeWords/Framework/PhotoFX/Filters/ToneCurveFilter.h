//
//  ToneCurveFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface ToneCurveFilter : Filter

+ (ToneCurveFilter *)filterWithInputPoint0:(CIVector *)inputPoint0
                               inputPoint1:(CIVector *)inputPoint1
                               inputPoint2:(CIVector *)inputPoint2
                               inputPoint3:(CIVector *)inputPoint3
                               inputPoint4:(CIVector *)inputPoint4;

@end
