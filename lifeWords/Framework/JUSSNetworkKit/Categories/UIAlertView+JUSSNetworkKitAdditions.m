//
//  UIAlertView+JUSSNetworkKitAdditions.m
//  JUSSNetworkKitDemo
//
//  Created by JustaLiar on 08/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#if TARGET_OS_IPHONE
#import "UIAlertView+JUSSNetworkKitAdditions.h"

@implementation UIAlertView (JUSSNetworkKitAdditions)

+(UIAlertView*) showWithError:(NSError*) networkError {

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[networkError localizedDescription]
                                                    message:[networkError localizedRecoverySuggestion]
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"Dismiss", @"")
                                          otherButtonTitles:nil];
    [alert show];
    return alert;
}
@end
#endif