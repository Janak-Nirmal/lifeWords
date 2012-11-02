//
//  SourceAtopCompositingFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface SourceAtopCompositingFilter : Filter

+ (SourceAtopCompositingFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage;

@end
