//
//  AffineTransformFilter.m
//  PhotoFX
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIAffineTransform"

#import "AffineTransformFilter.h"

@implementation AffineTransformFilter

+ (AffineTransformFilter *)filterWithInputTransform:(CGAffineTransform)inputTransform {
    AffineTransformFilter *atf = [[AffineTransformFilter alloc] init];
    
    atf.filter = [CIFilter filterWithName:kFilterName];
    [atf.filter setDefaults];
    [atf.filter setValue:[NSValue valueWithCGAffineTransform:inputTransform] forKey:@"inputTransform"];
    
    return atf;
}

@end
