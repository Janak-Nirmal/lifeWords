//
//  MinimumCompositingFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIMinimumCompositing"

#import "MinimumCompositingFilter.h"

@implementation MinimumCompositingFilter

+ (MinimumCompositingFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    MinimumCompositingFilter *mcf = [[MinimumCompositingFilter alloc] init];
    
    mcf.filter = [CIFilter filterWithName:kFilterName];
    [mcf.filter setDefaults];
    [mcf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return mcf;
}

@end
