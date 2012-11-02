//
//  UIImage+Helpers.h
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (Helpers)

- (UIImage *)resize:(CGSize)size;
- (UIImage *)crop:(CGRect)rect;
- (UIImage *)tile:(CGSize)size;
- (UIImage *)normalizedImage;
@end

