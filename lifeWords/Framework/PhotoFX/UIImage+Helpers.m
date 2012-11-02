//
//  UIImage+Helpers.m
//  lifeWords
//
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "UIImage+Helpers.h"
#import "CropFilter.h"
#import "FX.h"

@implementation UIImage (Helpers)

- (UIImage *)resize:(CGSize)size {

    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resizedImage;
}

- (UIImage *)crop:(CGRect)rect {
    CIImage *inputImage = [[CIImage alloc] initWithImage:self];
    CropFilter *cf = [CropFilter filterWithInputRectangle:[CIVector vectorWithX:rect.origin.x 
                                                                              Y:rect.origin.y 
                                                                              Z:rect.size.width 
                                                                              W:rect.size.height]];
    return [FX renderImage:[cf applyFilter:inputImage]];
}

- (UIImage *)tile:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef imageContext = UIGraphicsGetCurrentContext();
    CGContextDrawTiledImage(imageContext, (CGRect){ CGPointZero, self.size }, [self CGImage]);
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}

- (UIImage *)normalizedImage {
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

@end
