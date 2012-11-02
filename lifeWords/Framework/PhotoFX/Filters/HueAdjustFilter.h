//
//  HueAdjustFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface HueAdjustFilter : Filter

+ (HueAdjustFilter *)filterWithInputAngle:(CGFloat)inputAngle;

@end
