//
//  MaximumCompositingFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIMaximumCompositing"

#import "MaximumCompositingFilter.h"

@implementation MaximumCompositingFilter

+ (MaximumCompositingFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    MaximumCompositingFilter *mcf = [[MaximumCompositingFilter alloc] init];
    
    mcf.filter = [CIFilter filterWithName:kFilterName];
    [mcf.filter setDefaults];
    [mcf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return mcf;
}

@end
