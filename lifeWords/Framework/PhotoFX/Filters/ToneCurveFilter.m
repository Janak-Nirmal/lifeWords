//
//  ToneCurveFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//
#define kFilterName @"CIToneCurve"

#import "ToneCurveFilter.h"

@implementation ToneCurveFilter

+ (ToneCurveFilter *)filterWithInputPoint0:(CIVector *)inputPoint0 
                               inputPoint1:(CIVector *)inputPoint1 
                               inputPoint2:(CIVector *)inputPoint2 
                               inputPoint3:(CIVector *)inputPoint3 
                               inputPoint4:(CIVector *)inputPoint4 {
    
    ToneCurveFilter *tcf = [[ToneCurveFilter alloc] init];
    
    tcf.filter = [CIFilter filterWithName:kFilterName];
    [tcf.filter setDefaults];
    [tcf.filter setValue:inputPoint0 forKey:@"inputPoint0"];
    [tcf.filter setValue:inputPoint1 forKey:@"inputPoint1"];
    [tcf.filter setValue:inputPoint2 forKey:@"inputPoint2"];
    [tcf.filter setValue:inputPoint3 forKey:@"inputPoint3"];
    [tcf.filter setValue:inputPoint4 forKey:@"inputPoint4"];
    
    return tcf;
}

@end
