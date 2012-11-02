//
//  AdditionCompositingFilter.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define kFilterName @"CIAdditionCompositing"

#import "AdditionCompositingFilter.h"

@implementation AdditionCompositingFilter

+ (AdditionCompositingFilter *)filterWithInputBackgroundImage:(CIImage *)inputBackgroundImage {
    AdditionCompositingFilter *acf = [[AdditionCompositingFilter alloc] init];
    
    acf.filter = [CIFilter filterWithName:kFilterName];
    [acf.filter setDefaults];
    [acf.filter setValue:inputBackgroundImage forKey:kCIInputBackgroundImageKey];
    
    return acf;
}

@end
