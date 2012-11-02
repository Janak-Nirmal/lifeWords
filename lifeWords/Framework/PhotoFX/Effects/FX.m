//
//  lifeWords.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "FX.h"

@implementation FX

+ (UIImage *)renderImage:(CIImage *)image {
    NSDictionary *options =	[NSDictionary	
                             dictionaryWithObject:[NSNumber	numberWithBool:NO]	
                             forKey:kCIContextUseSoftwareRenderer];
    CIContext *context = [CIContext contextWithOptions:options];
    CGImageRef cgImage = [context createCGImage:image fromRect:[image extent]];
    UIImage *renderedImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return renderedImage;
}

@end
