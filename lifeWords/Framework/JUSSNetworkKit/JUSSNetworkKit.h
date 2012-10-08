//
//  JUSSNetworkKit.h
//  JUSSNetworkKit
//
//  Created by JustaLiar on 08/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#ifndef JUSSNetworkKit_JUSSNetworkKit_h
#define JUSSNetworkKit_JUSSNetworkKit_h

#ifndef __IPHONE_4_0
#error "JUSSNetworkKit uses features only available in iOS SDK 4.0 and later."
#endif

#if TARGET_OS_IPHONE
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
#define DO_GCD_RETAIN_RELEASE 0
#else
#define DO_GCD_RETAIN_RELEASE 1
#endif
#elif TARGET_OS_MAC
#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>
#if MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
#define DO_GCD_RETAIN_RELEASE 0
#else
#define DO_GCD_RETAIN_RELEASE 1
#endif
#endif

#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);};

#import "Categories/NSString+JUSSNetworkKitAdditions.h"
#import "Categories/NSDictionary+RequestEncoding.h"
#import "Categories/NSDate+RFC1123.h"
#import "Categories/NSData+Base64.h"

#if TARGET_OS_IPHONE
#import "Categories/UIAlertView+JUSSNetworkKitAdditions.h"
#elif TARGET_OS_MAC
#import "Categories/NSAlert+JUSSNetworkKitAdditions.h"
#endif

#import "Reachability/Reachability.h"

#import "JUSSNetworkOperation.h"
#import "JUSSNetworkEngine.h"

#define kJUSSNetworkEngineOperationCountChanged @"kJUSSNetworkEngineOperationCountChanged"
#define JUSSNetworkCACHE_DEFAULT_COST 10
#define JUSSNetworkCACHE_DEFAULT_DIRECTORY @"JUSSNetworkKitCache"
#define kJUSSNetworkKitDefaultCacheDuration 60 // 1 minute
#define kJUSSNetworkKitDefaultImageHeadRequestDuration 3600*24*1 // 1 day (HEAD requests with eTag are sent only after expiry of this. Not that these are not RFC compliant, but needed for performance tuning)
#define kJUSSNetworkKitDefaultImageCacheDuration 3600*24*7 // 1 day

// if your server takes longer than 30 seconds to provide real data,
// you should hire a better server developer.
// on iOS (or any mobile device), 30 seconds is already considered high.

#define kJUSSNetworkKitRequestTimeOutInSeconds 30
#endif


