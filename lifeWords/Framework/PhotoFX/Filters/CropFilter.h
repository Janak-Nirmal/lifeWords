//
//  AdditionCompositingFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface CropFilter : Filter

+ (CropFilter *)filterWithInputRectangle:(CIVector *)inputRectangle;

@end
