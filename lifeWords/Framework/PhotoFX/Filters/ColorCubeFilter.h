//
//  ColorCubeFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface ColorCubeFilter : Filter

+ (ColorCubeFilter *) filterWithInputCubeDimension:(CGFloat)inputCubeDimension 
                                     inputCubeData:(NSData *)inputCubeData;

@end
