//
//  YLBackgroundView.m
//
//  Created by JustaLiar on 10/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "YLBackgroundView.h"

#import "ARCMacro.h"

@interface YLBackgroundView ()
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIImage *noizeImage;

/** Loads the noize image. */
- (void)loadNoizeImage;

@end

@implementation YLBackgroundView
@synthesize noizeImage;

- (void)dealloc
{
    SAFE_ARC_RELEASE (noizeImage);
    
    SAFE_ARC_SUPER_DEALLOC ();
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self loadNoizeImage];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self loadNoizeImage];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    {
        size_t num_locations            = 2;
        CGFloat locations[2]            = {0.1, 0.9};
        CGFloat colorComponents[8]      = {32.0/255.0, 36.0/255.0, 41.0/255.0, 1.0,  
                                           68.0/255.0, 68.0/255.0, 68.0/255.0, 1.0};
        CGColorSpaceRef myColorspace    = CGColorSpaceCreateDeviceRGB();
        CGGradientRef gradient          = CGGradientCreateWithColorComponents (myColorspace, colorComponents, locations, num_locations);
        
        CGPoint centerPoint             = CGPointMake(self.bounds.size.width / 2.0,
                                                      self.bounds.size.height / 2.0);
        
        // Draw the gradient
        CGContextDrawRadialGradient(context, gradient, centerPoint, rect.size.width / 2, centerPoint, 0, (kCGGradientDrawsBeforeStartLocation));
        
        CGGradientRelease(gradient);
        CGColorSpaceRelease(myColorspace);
    }
    CGContextRestoreGState(context);
    
    // Blend the noize texture to the background
    CGSize textureSize                  = [noizeImage size];
    CGContextDrawTiledImage(context, CGRectMake(0, 0, textureSize.width, textureSize.height), noizeImage.CGImage);
}

#pragma mark -
#pragma mark YLBackgroundView Public Methods

#pragma mark YLBackgroundView Private Methods

- (void)loadNoizeImage
{
    self.noizeImage = [UIImage imageNamed:@"noise.png"];
}

@end
