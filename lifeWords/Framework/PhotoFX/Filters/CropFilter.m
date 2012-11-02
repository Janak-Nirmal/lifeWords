//
//  ColorInvertFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CICrop"

#import "CropFilter.h"

@implementation CropFilter

+ (CropFilter *)filterWithInputRectangle:(CIVector *)inputRectangle; {
    CropFilter *cf = [[CropFilter alloc] init];
    
    cf.filter = [CIFilter filterWithName:kFilterName];
    [cf.filter setValue:inputRectangle forKey:@"inputRectangle"];
    
    return cf;  
}
@end
