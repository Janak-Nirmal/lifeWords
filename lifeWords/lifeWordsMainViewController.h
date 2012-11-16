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
#import "ODRefreshControl.h"
#import "SWSnapshotStackView.h"

@interface lifeWordsMainViewController : UIViewController <UIImagePickerControllerDelegate, UIPopoverControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIScrollViewDelegate> {
    NSString *userEmail;
    NSString *color;
}

#pragma mark - Photo
@property (nonatomic, retain) UIPopoverController *popover;
@property (strong, nonatomic) IBOutlet UIButton *makeCardButton;
- (IBAction) showActionSheet:(id)sender;
- (IBAction)test:(id)sender;


#pragma mark - Toolbars
@property (strong, nonatomic) IBOutlet UIToolbar *myToolBar;
@property (strong, nonatomic) IBOutlet UIButton *friendsBtn;

#pragma mark - Decoration
@property (strong, nonatomic) IBOutlet UIImageView *wallpaper;
@property (strong, nonatomic) IBOutlet SWSnapshotStackView *profilePhoto;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet SWSnapshotStackView *container;

@property (strong, nonatomic) NSUserDefaults *coreDatabase;
@property (strong, nonatomic) JUSSNetworkOperation *downloadOperation;
@property (strong, nonatomic) JUSSNetworkOperation *fetchUserInfo;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
