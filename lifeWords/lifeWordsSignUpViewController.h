//
//  lifeWordsSignUpViewController.h
//  lifeWords
//
//  Created by JustaLiar on 18/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGlossyButton.h"
#import <QuartzCore/QuartzCore.h>
#import "OLGhostAlertView.h"
#import "lifeWordsAppDelegate.h"
#import "MBProgressHUD.h"

@interface lifeWordsSignUpViewController : UIViewController <UIImagePickerControllerDelegate, UIPopoverControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UITextFieldDelegate, MBProgressHUDDelegate> {
}
@property (strong, nonatomic) IBOutlet UIView *signUpBox;
@property (nonatomic, retain) UIPopoverController *popover;

#pragma mark - Data Elements
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *verifyPassword;
@property (strong, nonatomic) IBOutlet UITextField *nickname;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UIButton *photoButton;
@property (strong, nonatomic) IBOutlet UIGlossyButton *signUpButton;
@property (strong, nonatomic) JUSSNetworkOperation *signUpOperation;

#pragma mark - Decoration Elements
- (IBAction)emailTapped:(id)sender;
- (IBAction)passwordTapped:(id)sender;
- (IBAction)verifyPasswordTapped:(id)sender;
- (IBAction)nicknameTapped:(id)sender;
- (IBAction) showActionSheet:(id)sender;
- (IBAction)signUpButtonClicked:(id)sender;
- (IBAction)dismissView:(id)sender;
- (IBAction)dismissKeyboard;
@end
