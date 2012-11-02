//
//  HighlightShadowAdjustFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIHighlightShadowAdjust"

#import "HighlightShadowAdjustFilter.h"

@implementation HighlightShadowAdjustFilter

+ (HighlightShadowAdjustFilter *) filterWithInputHighlightAmount:(CGFloat)inputHighlightAmount 
                                               inputShadowAmount:(CGFloat)inputShadowAmount {
    
    HighlightShadowAdjustFilter *hsaf = [[HighlightShadowAdjustFilter alloc] init];
    
    hsaf.filter = [CIFilter filterWithName:kFilterName];
    [hsaf.filter setDefaults];
    [hsaf.filter setValue:[NSNumber numberWithFloat:inputHighlightAmount] forKey:@"inputHighlightAmount"];
    [hsaf.filter setValue:[NSNumber numberWithFloat:inputShadowAmount] forKey:@"inputShadowAmount"];
    
    return hsaf;
}


@end
