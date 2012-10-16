//
//  lifeWordsMainViewController.h
//  lifeWords
//
//  Created by JustaLiar on 21/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "lifeWordsAppDelegate.h"
#import "JSBadgeView.h"
#import "OLGhostAlertView.h"
#import <QuartzCore/QuartzCore.h>


@interface lifeWordsMainViewController : UIViewController <UIImagePickerControllerDelegate, UIPopoverControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

#pragma mark - Photo
@property (nonatomic, retain) UIPopoverController *popover;
@property (strong, nonatomic) IBOutlet UIButton *makeCardButton;
- (IBAction) showActionSheet:(id)sender;

#pragma mark - Decoration
@property (strong, nonatomic) IBOutlet UIImageView *profilePhoto;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIView *toolBar;
@property (strong, nonatomic) IBOutlet UIButton *cards;

@property (strong, nonatomic) NSUserDefaults *coreDatabase;
@property (strong, nonatomic) JUSSNetworkOperation *downloadOperation;
@property (strong, nonatomic) JUSSNetworkOperation *fetchUserInfo;
@end
