//
//  lifeWordsAppDelegate.h
//  lifeWords
//
//  Created by JustaLiar on 3/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lifeWordsNetworkOperations.h"
#import "lifeWordsNetworkDownload.h"

#define ApplicationDelegate ((lifeWordsAppDelegate *)[UIApplication sharedApplication].delegate)

@interface lifeWordsAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) lifeWordsNetworkOperations *networkOperations;
@property (strong, nonatomic) lifeWordsNetworkDownload *downloadOperation;
@property (strong, nonatomic) NSString *hostName;

@end
