//
//  MaximumCompositingFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface MaximumCompositingFilter : Filter

+ (MaximumCompositingFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage;

@end
