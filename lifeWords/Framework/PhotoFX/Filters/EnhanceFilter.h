//
//  EnhanceFilter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filter.h"

@interface EnhanceFilter : Filter {
    BOOL redEyeCorrection;
}

@property (atomic, assign) BOOL redEyeCorrection;

+ (EnhanceFilter *)filterWithRedEyeCorrection:(BOOL)redEyeCorrection;

@end
