//
//  TemperatureAndTintFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CITemperatureAndTint"

#import "TemperatureAndTintFilter.h"

@implementation TemperatureAndTintFilter

+ (TemperatureAndTintFilter *)filterWithInputNeutral:(CIVector *)inputNeutral 
                                  inputTargetNeutral:(CIVector *)inputTargetNeutral {
    TemperatureAndTintFilter *ttf = [[TemperatureAndTintFilter alloc] init];
    
    ttf.filter = [CIFilter filterWithName:kFilterName];
    [ttf.filter setDefaults];
    [ttf.filter setValue:inputNeutral forKey:@"inputNeutral"];
    [ttf.filter setValue:inputTargetNeutral forKey:@"inputTargetNeutral"];
    
    return ttf;    
}

@end
