//
//  MultiplyCompositingFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface MultiplyCompositingFilter : Filter

+ (MultiplyCompositingFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage;

@end
