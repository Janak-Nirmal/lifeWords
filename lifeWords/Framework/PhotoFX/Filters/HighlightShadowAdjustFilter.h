//
//  HighlightShadowAdjustFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface HighlightShadowAdjustFilter : Filter

+ (HighlightShadowAdjustFilter *) filterWithInputHighlightAmount:(CGFloat)inputHighlightAmount 
                                               inputShadowAmount:(CGFloat)inputShadowAmount;

@end
