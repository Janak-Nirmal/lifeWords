//
//  MultiplyCompositingFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIMultiplyCompositing"

#import "MultiplyCompositingFilter.h"

@implementation MultiplyCompositingFilter

+ (MultiplyCompositingFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    MultiplyCompositingFilter *mcf = [[MultiplyCompositingFilter alloc] init];
    
    mcf.filter = [CIFilter filterWithName:kFilterName];
    [mcf.filter setDefaults];
    [mcf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return mcf;
}

@end
