//
//  Filter.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filter : NSObject {
    @protected
    CIFilter *filter;
}

@property (nonatomic, retain) CIFilter *filter; 

- (CIImage *)applyFilter:(CIImage *)inputImage;

@end
