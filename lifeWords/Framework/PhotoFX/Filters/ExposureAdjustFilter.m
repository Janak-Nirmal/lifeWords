//
//  ExposureAdjustFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIExposureAdjust"

#import "ExposureAdjustFilter.h"

@implementation ExposureAdjustFilter

+ (ExposureAdjustFilter *) filterWithInputEV :(CGFloat)inputEV {
    
    ExposureAdjustFilter *eaf = [[ExposureAdjustFilter alloc] init];
    
    eaf.filter = [CIFilter filterWithName:kFilterName];
    [eaf.filter setDefaults];
    [eaf.filter setValue:[NSNumber numberWithFloat:inputEV] forKey:@"inputEV"];
    
    return eaf;
}

@end
