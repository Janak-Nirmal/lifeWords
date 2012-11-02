//
//  ColorCubeFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIColorCube"

#import "ColorCubeFilter.h"

@implementation ColorCubeFilter

+ (ColorCubeFilter *) filterWithInputCubeDimension:(CGFloat)inputCubeDimension 
                                     inputCubeData:(NSData *)inputCubeData {
    
    ColorCubeFilter *ccf = [[ColorCubeFilter alloc] init];
    
    ccf.filter = [CIFilter filterWithName:kFilterName];
    [ccf.filter setDefaults];
    [ccf.filter setValue:[NSNumber numberWithFloat:inputCubeDimension] forKey:@"inputCubeDimension"];
    [ccf.filter setValue:inputCubeData forKey:@"inputCubeData"];
    
    return ccf;
}

@end
