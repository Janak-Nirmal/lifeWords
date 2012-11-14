//
//  YLProgressBar.h
//
//  Created by JustaLiar on 10/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLProgressBar : UIProgressView
{
@public
    BOOL        animated;
    UIColor*    progressTintColor;
    
@protected
    double      progressOffset;
    CGFloat     cornerRadius;
    NSTimer*    animationTimer;
}
/** Run the animation of the progress bar. YES by default. */
@property (nonatomic, getter = isAnimated) BOOL animated;
@property (nonatomic, retain) UIColor *progressTintColor;

#pragma mark Constructors - Initializers

#pragma mark Public Methods

@end
