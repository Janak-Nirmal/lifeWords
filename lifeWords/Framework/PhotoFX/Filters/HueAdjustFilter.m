//
//  HueAdjustFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIHueAdjust"

#import "HueAdjustFilter.h"

@implementation HueAdjustFilter

+ (HueAdjustFilter *)filterWithInputAngle:(CGFloat)inputAngle {
    HueAdjustFilter *haf = [[HueAdjustFilter alloc] init];
    
    haf.filter = [CIFilter filterWithName:kFilterName];
    [haf.filter setDefaults];
    [haf.filter setValue:[NSNumber numberWithFloat:inputAngle] forKey:@"inputAngle"];
    
    return haf;
}

@end
