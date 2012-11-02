//
//  AffineTransformFilter.h
//  PhotoFX
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface AffineTransformFilter : Filter

+ (AffineTransformFilter *)filterWithInputTransform:(CGAffineTransform)inputTransform;

@end
