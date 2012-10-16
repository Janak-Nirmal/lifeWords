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

@interface lifeWordsMainViewController () {
    NSDictionary *userInfo;
    UIImage *chosenPhoto;
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
    
	// Do any additional setup after loading the view.
    self.coreDatabase = [NSUserDefaults standardUserDefaults];
    [self.toolBar.layer setBorderWidth:2.0f];
    [self.toolBar.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    // Hide Navigation Bar
    [self.navigationController navigationBar].hidden = YES;
    
    // Set User Nicname or Email
    if ([self.coreDatabase objectForKey:@"User_Nickname"]) {
        [self.nameLabel setText:[self.coreDatabase objectForKey:@"User_Nickname"]];
    }
    else {
        [self.nameLabel setText:[self.coreDatabase objectForKey:@"User_Email"]];
    }
    
    // Fetch the lastest user info
    self.fetchUserInfo = [ApplicationDelegate.networkOperations fetchUserInfo:[self.coreDatabase objectForKey:@"User_Email"]];
    [self.fetchUserInfo onCompletion:^(JUSSNetworkOperation *completedOperation) {
        userInfo = [completedOperation responseJSON];
        if ([userInfo objectForKey:@"User_Nickname"]) {
            [self.nameLabel setText:[userInfo objectForKey:@"User_Nickname"]];
            [self.coreDatabase setObject:[userInfo objectForKey:@"User_Nickname"] forKey:@"User_Nickname"];
        }
        else {
            [self.nameLabel setText:[userInfo objectForKey:@"User_Email"]];
        }
        
    } onError:^(NSError *error) {
        OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Connection Error" message: @"Please check your internet connection" timeout:1 dismissible:YES];
        [ghastly show];
    }];
    
    // Set User Nicname or Email
    NSLog(@"%@", [self.coreDatabase objectForKey:@"User_Nickname"]);
    if ([self.coreDatabase objectForKey:@"User_Nickname"]) {
        [self.nameLabel setText:[self.coreDatabase objectForKey:@"User_Nickname"]];
    }
    else {
        [self.nameLabel setText:[self.coreDatabase objectForKey:@"User_Email"]];
    }
    
    // Download the newest profile photo
    NSString *profilePhotoURL = [self.coreDatabase objectForKey:@"profilePhotoURL"];
    NSString *profilePhotoPath = [self.coreDatabase objectForKey:@"profilePhotoPath"];
    [self.profilePhoto setImage:[UIImage imageWithContentsOfFile:profilePhotoPath] borderWidth:5.0f shadowDepth:10.0f controlPointXOffset:30.0f controlPointYOffset:70.0f];
    
    self.downloadOperation = [ApplicationDelegate.networkOperations downloadFile:profilePhotoURL toFile:profilePhotoPath];
    [self.downloadOperation onCompletion:^(JUSSNetworkOperation *completedOperation) {
        // Set profile photo
        [self.profilePhoto setImage:[UIImage imageWithContentsOfFile:profilePhotoPath] borderWidth:5.0f shadowDepth:10.0f controlPointXOffset:30.0f controlPointYOffset:70.0f];
    } onError:^(NSError *error) {
        OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Connection Error" message: @"Please check your internet connection" timeout:1 dismissible:YES];
        [ghastly show];
    }];
    
    // Dislay the notifications
    JSBadgeView *friendsBadge = [[JSBadgeView alloc] initWithParentView:self.cards
 alignment:JSBadgeViewAlignmentTopRight];
    friendsBadge.badgeText = @"4";
    friendsBadge.badgePositionAdjustment = CGPointMake(-2.0f, 5.0f);
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    
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
    [self setToolBar:nil];
    [self setCards:nil];
    [self setMakeCardButton:nil];
    [super viewDidUnload];
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
        [self presentModalViewController:picker animated:YES];
        //self.popover = [[UIPopoverController alloc] initWithContentViewController:picker];
        
        //self.popover.delegate = self;
        //[self.popover presentPopoverFromRect:self.makeCardButton.frame inView:self.view
         //           permittedArrowDirections:UIPopoverArrowDirectionAny
          //                          animated:YES];
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
    [self dismissModalViewControllerAnimated:YES];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [picker dismissModalViewControllerAnimated:YES];
    } else {
        [self.popover dismissPopoverAnimated:NO];
        self.popover = nil;
    }
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    chosenPhoto = image;
    [self performSegueWithIdentifier:@"toPhotoFiltering" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toPhotoFiltering"]) {
        // Get reference to the destination view controller
        lifeWordsPhotoFilteringViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setPhoto:chosenPhoto];
    }
}

@end
