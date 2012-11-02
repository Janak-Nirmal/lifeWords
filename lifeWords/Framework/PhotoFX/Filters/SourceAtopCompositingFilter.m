//
//  SourceAtopCompositingFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CISourceAtopCompositing"

#import "SourceAtopCompositingFilter.h"

@implementation SourceAtopCompositingFilter

+ (SourceAtopCompositingFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    SourceAtopCompositingFilter *sacf = [[SourceAtopCompositingFilter alloc] init];
    
    sacf.filter = [CIFilter filterWithName:kFilterName];
    [sacf.filter setDefaults];
    [sacf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return sacf;
}

@end
