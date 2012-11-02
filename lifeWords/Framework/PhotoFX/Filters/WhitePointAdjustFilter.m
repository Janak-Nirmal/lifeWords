//
//  WhitePointAdjustFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIWhitePointAdjust"

#import "WhitePointAdjustFilter.h"

@implementation WhitePointAdjustFilter

+ (WhitePointAdjustFilter *)filterWithInputColor:(CIColor *)inputColor {
    WhitePointAdjustFilter *wpaf = [[WhitePointAdjustFilter alloc] init];
    
    wpaf.filter = [CIFilter filterWithName:kFilterName];
    [wpaf.filter setDefaults];
    [wpaf.filter setValue:inputColor forKey:@"inputColor"];
    
    return wpaf;
}

@end

