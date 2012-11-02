//
//  VibranceFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIVibrance"

#import "VibranceFilter.h"

@implementation VibranceFilter

+ (VibranceFilter *)filterWithInputAmount:(CGFloat)inputAmount {
    VibranceFilter *vf = [[VibranceFilter alloc] init];
    
    vf.filter = [CIFilter filterWithName:kFilterName];
    [vf.filter setDefaults];
    [vf.filter setValue:[NSNumber numberWithFloat:inputAmount] forKey:@"inputAmount"];
    
    return vf;    
}

@end
