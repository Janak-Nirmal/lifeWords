//
//  OLGhostAlertView.h
//
//  Created by JustaLiar on 09/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OLGhostAlertView : UIView

- (id)initWithTitle:(NSString *)title;
- (id)initWithTitle:(NSString *)title message:(NSString *)message;
- (id)initWithTitle:(NSString *)title message:(NSString *)message timeout:(NSTimeInterval)timeout dismissible:(BOOL)dismissible;
- (void)show;
- (void)hide;

@end
