//
//  ColorMatrixFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface ColorMatrixFilter : Filter

+ (ColorMatrixFilter *)filterWithInputRVector:(CIVector *)inputRVector
                                 inputGVector:(CIVector *)inputGVector                               
                                 inputBVector:(CIVector *)inputBVector
                                 inputAVector:(CIVector *)inputAVector
                                 inputBiasVector:(CIVector *)inputBiasVector;


@end
