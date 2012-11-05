//
//  lifeWordsSignUpViewController.m
//  lifeWords
//
//  Created by JustaLiar on 18/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsSignUpViewController.h"

@interface lifeWordsSignUpViewController () {
    MBProgressHUD *HUD;
    NSString *signUpError;
}

@end

@implementation lifeWordsSignUpViewController

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
    
    // Adjust background for the Sign Up box
    [self.signUpBox.layer setCornerRadius:10.0f];
    
    // Adjust Sign Up Button
    UIGlossyButton *signUpButton;
    signUpButton = (UIGlossyButton *)[self.view viewWithTag:1];
    [signUpButton useWhiteLabel: YES];
    signUpButton.buttonCornerRadius = 5.0;
    signUpButton.buttonBorderWidth = 1.0f;
	[signUpButton setStrokeType: kUIGlossyButtonStrokeTypeBevelUp];
    signUpButton.tintColor = signUpButton.borderColor = [UIColor colorWithRed:0 green:0.5 blue:0.7 alpha:1];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload {
    [self setPhotoButton:nil];
    [self setPhoto:nil];
    [self setSignUpBox:nil];
    [self setEmail:nil];
    [self setPassword:nil];
    [self setNickname:nil];
    [self setSignUpButton:nil];
    [self setVerifyPassword:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Image Picker for the profile photo

- (void)pickImage:(BOOL)camera
{
    
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    if (camera) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self presentModalViewController:picker animated:YES];
    }
    else {
        self.popover = [[UIPopoverController alloc] initWithContentViewController:picker];
        self.popover.delegate = self;
        [self.popover presentPopoverFromRect:self.photoButton.frame inView:self.signUpBox
                         permittedArrowDirections:UIPopoverArrowDirectionAny
                                         animated:YES];
    }
}

- (IBAction) showActionSheet:(id)sender
{
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    [self.nickname resignFirstResponder];
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
        [picker dismissModalViewControllerAnimated:YES];
    } else {
        [self.popover dismissPopoverAnimated:NO];
        self.popover = nil;
    }
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    self.photo.image = image;
    
}

#pragma mark - Data Validation

-(BOOL) validateEmail:(NSString*) candidate
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return[emailTest evaluateWithObject:candidate];
}

- (IBAction)signUpButtonClicked:(id)sender
{
    if ([self.email.text isEqualToString:@""] || [self.password.text isEqualToString:@""] || [self.verifyPassword.text isEqualToString:@""]) {
        [self shakeView:self.signUpBox];
    }
    else {
        [self.email resignFirstResponder];
        [self.password resignFirstResponder];
        [self.nickname resignFirstResponder];
        NSString *error = @"";
        if (![self validateEmail:self.email.text]) {
            if ([error isEqualToString:@""]) {
                error = [error stringByAppendingString:@"The email address you entered is not valid\n"];
            }
            else {
                error = [error stringByAppendingString:@"The email address you entered is not valid"];
            }
            self.email.textColor = [UIColor redColor];
        }
        if (self.password.text.length < 6) {
            if ([error isEqualToString:@""]) {
                error = [error stringByAppendingString:@"The password you entered is less than 6 characters\n"];
            }
            else {
                error = [error stringByAppendingString:@"The password you entered is less than 6 characters"];
            }
            self.password.textColor = [UIColor redColor];
        }
        if (![self.verifyPassword.text isEqualToString:self.password.text]) {
 
            error = [error stringByAppendingString:@"\nThe password you entered is not match"];
            
            self.password.textColor = [UIColor redColor];
            self.verifyPassword.textColor = [UIColor redColor];
        }
        if (![error isEqualToString:@""]) {
            [self dismissKeyboard];
            OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Oppps.." message:error timeout:1.5 dismissible:YES];
            [ghastly show];
        }
        else {
            [self dismissKeyboard];
            signUpError = nil;
            HUD = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUD];
            HUD.labelText = @"Signing Up...";
            HUD.dimBackground = YES;
            HUD.minSize = CGSizeMake(140.f, 140.f);
            [HUD show:YES];
            [self signUp];
        }

    }
}

- (void) signUp
{
    NSData *photo = UIImageJPEGRepresentation(self.photo.image, 1);
    self.signUpOperation = [ApplicationDelegate.networkOperations signUp:self.email.text andPassword:self.password.text andNickname:self.nickname.text withProfilePhoto:photo];
    [self.signUpOperation onCompletion:^(JUSSNetworkOperation *completedOperation) {
        NSString *result = [self.signUpOperation responseString];
        NSLog(@"%@", result);
        if ([result isEqualToString:@"email"]) {
            [HUD removeFromSuperview];
            OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Oppps.." message:@"The email address you are trying to register is already used" timeout:1.5 dismissible:YES];
            [self.email setTextColor:[UIColor redColor]];
            [ghastly show];
        }
        else if ([result isEqualToString:@"success"]) {
            HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            HUD.mode = MBProgressHUDModeCustomView;
            HUD.labelText = @"Completed";
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(dismissView:) userInfo:nil repeats:NO];
        }
        else {
            [HUD removeFromSuperview];
            OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Server Error" message: @"We are trying to get it back to work. Sorry for any inconvenince caused" timeout:1.5 dismissible:YES];
            [ghastly show];
        }
        
    } onError:^(NSError *error) {
        [HUD removeFromSuperview];
        OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Connection Error" message: @"Please check your internet connection" timeout:1.5 dismissible:YES];
        [ghastly show];
    }];
}

#pragma mark - Decoration

- (IBAction)emailTapped:(id)sender
{
    [self.email becomeFirstResponder];
}

- (IBAction)passwordTapped:(id)sender
{
    [self.password becomeFirstResponder];
}

- (IBAction)verifyPasswordTapped:(id)sender
{
    [self.verifyPassword becomeFirstResponder];
}

- (IBAction)nicknameTapped:(id)sender
{
    [self.nickname becomeFirstResponder];
}

- (void) shakeView: (UIView *)aView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.05];
    [animation setRepeatCount:4];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([aView center].x - 10.0f, [aView center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([aView center].x + 10.0f, [aView center].y)]];
    [[aView layer] addAnimation:animation forKey:@"position"];
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    textField.textColor = [UIColor blackColor];
}

- (IBAction)dismissView:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)dismissKeyboard {
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    [self.verifyPassword resignFirstResponder];
    [self.nickname resignFirstResponder];
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
	HUD = nil;
}


@end
