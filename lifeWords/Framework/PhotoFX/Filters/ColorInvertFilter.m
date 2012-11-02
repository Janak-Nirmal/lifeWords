//
//  ColorInvertFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIColorInvert"

#import "ColorInvertFilter.h"

@implementation ColorInvertFilter

+ (ColorInvertFilter *)filter {
    ColorInvertFilter *cif = [[ColorInvertFilter alloc] init];
    
    cif.filter = [CIFilter filterWithName:kFilterName];
    [cif.filter setDefaults];

    return cif;
}

@end
