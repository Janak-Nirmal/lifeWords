//
//  lifeWordsLoginViewController.h
//  lifeWords
//
//  Created by JustaLiar on 2/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "OLGhostAlertView.h"
#import "lifeWordsAppDelegate.h"

@interface lifeWordsLoginViewController : UIViewController

#pragma mark - Data Elements
@property (strong, nonatomic) IBOutlet UITextField *userEmail;
@property (strong, nonatomic) IBOutlet UITextField *userPassword;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

#pragma mark - Network Element
@property (strong, nonatomic) JUSSNetworkOperation *loginOperation;
@property (strong, nonatomic) JUSSNetworkOperation *downloadOperation;
@property (strong, nonatomic) JUSSNetworkOperation *fetchUserInfo;

- (IBAction)loginButtonClicked:(id)sender;

#pragma mark - Decoration
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView *loginBox;
- (IBAction)dismissKeyboard:(id)sender;
@end
