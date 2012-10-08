//
//  NSAlert+JUSSNetworkKitAdditions.m
//  JUSSNetworkKitDemo
//
//  Created by JustaLiar on 08/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#if !TARGET_OS_IPHONE
#import "NSAlert+JUSSNetworkKitAdditions.h"

@implementation NSAlert (JUSSNetworkKitAdditions)

+(NSAlert*) showWithError:(NSError*) networkError {

    DLog(@"%@", [networkError userInfo]);
    
    NSAlert *alert = [NSAlert alertWithError:networkError];
    [alert runModal];
    return alert;
}
@end
#endif