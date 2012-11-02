//
//  GammaAdjustFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIGammaAdjust"

#import "GammaAdjustFilter.h"

@implementation GammaAdjustFilter

+ (GammaAdjustFilter *) filterWithInputPower:(CGFloat)inputPower {
    
    GammaAdjustFilter *gaf = [[GammaAdjustFilter alloc] init];
    
    gaf.filter = [CIFilter filterWithName:kFilterName];
    [gaf.filter setDefaults];
    [gaf.filter setValue:[NSNumber numberWithFloat:inputPower] forKey:@"inputPower"];
    
    return gaf;
}


@end
