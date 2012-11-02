//
//  ColorMatrixFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIColorMatrix"

#import "ColorMatrixFilter.h"

@implementation ColorMatrixFilter

+ (ColorMatrixFilter *) filterWithInputRVector:(CIVector *)inputRVector 
                                  inputGVector:(CIVector *)inputGVector 
                                  inputBVector:(CIVector *)inputBVector 
                                  inputAVector:(CIVector *)inputAVector 
                               inputBiasVector:(CIVector *)inputBiasVector {
    
    ColorMatrixFilter *cmf = [[ColorMatrixFilter alloc] init];
    
    cmf.filter = [CIFilter filterWithName:kFilterName];
    [cmf.filter setDefaults];
    [cmf.filter setValue:inputRVector forKey:@"inputRVector"];
    [cmf.filter setValue:inputGVector forKey:@"inputGVector"];
    [cmf.filter setValue:inputBVector forKey:@"inputBVector"];
    [cmf.filter setValue:inputAVector forKey:@"inputAVector"];
    [cmf.filter setValue:inputBiasVector forKey:@"inputBiasVector"];
    
    return cmf;
}

@end
