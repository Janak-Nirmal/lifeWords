//
//  lifeWordsMainViewController.m
//  lifeWords
//
//  Created by JustaLiar on 21/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsMainViewController.h"
#import "UIImageView+Curled.h"
#import "lifeWordsPhotoFilteringViewController.h"
#import "KSCustomPopoverBackgroundView.h"

@interface lifeWordsMainViewController () {
    NSDictionary *userInfo;
    UIImage *chosenPhoto;
    ODRefreshControl *refreshControl;
}
@end

@implementation lifeWordsMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

#pragma mark - UIViewController Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Fetch data from NSUserDefaults
    self.coreDatabase = [NSUserDefaults standardUserDefaults];
    userEmail = [self.coreDatabase objectForKey:@"Current_User_Email"];
    color = [self.coreDatabase objectForKey:[NSString stringWithFormat:@"%@_Color", userEmail]];
    
    // Customize toolbar
    [self.friendsBtn setImage:[UIImage imageNamed:@"icon-friends.png"] forState:UIControlStateNormal];
    
    // Add UI refresh control
    refreshControl = [[ODRefreshControl alloc] initInScrollView:self.scrollView];
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [refreshControl setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    // Hide Navigation Bar
    [self.navigationController.navigationBar setHidden:YES];

    // Set stack container
    
    // Set toolbar background
    UIImage *navBarImg = [UIImage imageNamed:[NSString stringWithFormat:@"%@ipad-menubar-right.png", color]];
    [self.myToolBar setBackgroundImage:navBarImg forToolbarPosition:UIToolbarPositionTop barMetrics:UIBarMetricsDefault];
    
    // Set background image
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
    [self.view setBackgroundColor:bgColor];
    
    // Refresh Contents
    [self refresh];
    [refreshControl beginRefreshing];
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    
    // Save database
    [self.coreDatabase synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload {
    [self setProfilePhoto:nil];
    [self setCoreDatabase:nil];
    [self setNameLabel:nil];
    [self setMakeCardButton:nil];
    [self setFriendsBtn:nil];
    [self setMyToolBar:nil];
    [self setContainer:nil];
    [super viewDidUnload];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
#pragma mark - Image Picker for the profile photo

- (void)pickImage:(BOOL)camera
{
    
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    if (camera) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self presentModalViewController:picker animated:YES];
    }
    else {
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera ) {
            [self presentModalViewController:picker animated:YES];
        }
        else {
            self.popover = [[UIPopoverController alloc] initWithContentViewController:picker];
            self.popover.delegate = self;
            self.popover.popoverBackgroundViewClass = [KSCustomPopoverBackgroundView class];
            [self.popover presentPopoverFromRect:self.makeCardButton.frame inView:self.view
                    permittedArrowDirections:UIPopoverArrowDirectionAny
                                    animated:YES];
        }
    }
}

- (IBAction) showActionSheet:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *popupQuery = [[UIActionSheet alloc]  initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Album", nil];
        popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [popupQuery showInView:self.view];
    } else {
        [self pickImage:FALSE];
    }
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self pickImage:TRUE];
    } else if (buttonIndex == 1) {
        [self pickImage:FALSE];
    }
}

#pragma mark - UIPopoverControllerDelegate
- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    return YES;
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [picker dismissModalViewControllerAnimated:NO];
    } else {
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera ) {
            [picker dismissModalViewControllerAnimated:NO];
        }
        else {
            [self.popover dismissPopoverAnimated:NO];
        }
    }
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    chosenPhoto = image;
    
    // Push View Controller
    lifeWordsPhotoFilteringViewController *nextView = [self.navigationController.storyboard instantiateViewControllerWithIdentifier:@"photoFilteringView"];
    nextView.photo = chosenPhoto;
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [self.navigationController pushViewController:nextView animated:NO];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                     }];
}


- (void) refresh
{
    // Set the photo
    NSString *profilePhotoURL = [self.coreDatabase objectForKey:[NSString stringWithFormat:@"%@_profilePhotoURL", userEmail]];
    NSString *profilePhotoPath = [self.coreDatabase objectForKey:[NSString stringWithFormat:@"%@_profilePhotoPath", userEmail]];
    NSString *profileBackupPhotoPath = [self.coreDatabase objectForKey:[NSString stringWithFormat:@"%@_profileBackupPhotoPath", userEmail]];
    
    [self.profilePhoto setImage:[UIImage imageWithContentsOfFile:profileBackupPhotoPath] borderWidth:5.0f shadowDepth:10.0f controlPointXOffset:30.0f controlPointYOffset:70.0f];
    
    // Set User Nickname or Email
    if ([self.coreDatabase objectForKey:[NSString stringWithFormat:@"%@_Nickname", userEmail]]) {
        [self.nameLabel setText:[self.coreDatabase objectForKey:[NSString stringWithFormat:@"%@_Nickname", userEmail]]];
    }
    else {
        [self.nameLabel setText:userEmail];
    }
    
    // Fetch the lastest user info
    self.fetchUserInfo = [ApplicationDelegate.networkOperations fetchUserInfo:userEmail];
    [self.fetchUserInfo onCompletion:^(JUSSNetworkOperation *completedOperation) {
        userInfo = [completedOperation responseJSON];
        if ([userInfo objectForKey:@"User_Nickname"]) {
            [self.nameLabel setText:[userInfo objectForKey:@"User_Nickname"]];
            [self.coreDatabase setObject:[userInfo objectForKey:@"User_Nickname"] forKey:[NSString stringWithFormat:@"%@_Nickname", userEmail]];
        }
        else {
            [self.nameLabel setText:userEmail];
        }
        
    } onError:^(NSError *error) {
        OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Connection Error" message: @"Please check your internet connection" timeout:1 dismissible:YES];
        [ghastly show];
    }];
    
    
    // Download the newest profile photo
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    [fileManager removeItemAtPath:profilePhotoPath error:&error];
    
    self.downloadOperation = [ApplicationDelegate.networkOperations downloadFile:profilePhotoURL toFile:profilePhotoPath];
    [self.downloadOperation onCompletion:^(JUSSNetworkOperation *completedOperation) {
        
        if ([fileManager fileExistsAtPath:profilePhotoPath]) {
        // Set profile photo
        [self.profilePhoto setImage:[UIImage imageWithContentsOfFile:profilePhotoPath] borderWidth:5.0f shadowDepth:10.0f controlPointXOffset:30.0f controlPointYOffset:70.0f];
            NSError *error;
            [fileManager removeItemAtPath:profileBackupPhotoPath error:&error];
            [fileManager copyItemAtPath:profilePhotoPath toPath:profileBackupPhotoPath error:&error];
        }
        else {
            [self.profilePhoto setImage:[UIImage imageWithContentsOfFile:profileBackupPhotoPath] borderWidth:5.0f shadowDepth:10.0f controlPointXOffset:30.0f controlPointYOffset:70.0f];
        }
        [refreshControl endRefreshing];
    } onError:^(NSError *error) {
        [refreshControl endRefreshing];
        OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Connection Error" message: @"Please check your internet connection" timeout:1 dismissible:YES];
        [ghastly show];
    }];
    
    
    // Dislay the notifications
    JSBadgeView *friendsBadge = [[JSBadgeView alloc] initWithParentView:self.friendsBtn
                                                              alignment:JSBadgeViewAlignmentTopRight];
    friendsBadge.badgeText = @"4";
    friendsBadge.badgePositionAdjustment = CGPointMake(-2.0f, 5.0f);    
}



@end
