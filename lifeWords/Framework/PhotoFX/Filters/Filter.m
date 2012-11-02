//
//  Filter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "Filter.h"

@implementation Filter

@synthesize filter;

- (CIImage *)applyFilter:(CIImage *)inputImage {
    [filter setValue:inputImage forKey:@"inputImage"];
    return [filter outputImage];
}

@end
