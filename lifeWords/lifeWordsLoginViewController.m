//
//  lifeWordsLoginViewController.m
//  lifeWords
//
//  Created by JustaLiar on 2/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsLoginViewController.h"
#import "UIGlossyButton.h"
#import "lifeWordsMainViewController.h"


@interface lifeWordsLoginViewController () {
    NSString *result;
    NSString *documentsDirectory;
    NSString *usersPath;
    NSDictionary *userInfo;
}
@end

@implementation lifeWordsLoginViewController

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
    
    // Create Users Folder
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    
    usersPath = [documentsDirectory stringByAppendingPathComponent:@"Users"];
    NSError *error;
    if (![[NSFileManager defaultManager] fileExistsAtPath:usersPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:usersPath withIntermediateDirectories:NO attributes:nil error:&error];
    
    // Adjust Login Button
    [self.loginButton setEnabled:YES];
    UIGlossyButton *loginButton;
    loginButton = (UIGlossyButton *)[self.view viewWithTag:1];
    [loginButton useWhiteLabel: YES];
    loginButton.tintColor = loginButton.borderColor = [UIColor lightGrayColor];
	loginButton.buttonBorderWidth = 1.0f;
	loginButton.buttonCornerRadius = 10.0f;
    [loginButton setStrokeType: kUIGlossyButtonStrokeTypeBevelUp];
	//[loginButton setGradientType: kUIGlossyButtonGradientTypeLinearSmoothBrightToNormal];
	//[loginButton setExtraShadingType:kUIGlossyButtonExtraShadingTypeRounded];
    
    // Adjust Sign Up Button
    UIGlossyButton *signUpButton;
    signUpButton = (UIGlossyButton *)[self.view viewWithTag:2];
    [signUpButton useWhiteLabel: YES];
    signUpButton.buttonCornerRadius = 5.0;
    signUpButton.buttonBorderWidth = 1.0f;
	[signUpButton setStrokeType: kUIGlossyButtonStrokeTypeBevelUp];
    signUpButton.tintColor = signUpButton.borderColor = [UIColor colorWithRed:0 green:0.5 blue:0.7 alpha:1];
    
    // Set background for the the Login Box
    [self.loginBox.layer setCornerRadius:10.0f];
}

- (void)viewDidUnload {
    [self setLoginButton:nil];
    [self setActivityIndicator:nil];
    [self setUserEmail:nil];
    [self setUserPassword:nil];
    [self setLoginBox:nil];
    [self setLoginOperation:nil];
    [self setDownloadOperation:nil];
    [self setFetchUserInfo:nil];
    [super viewDidUnload];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    // Hide navigation bar
    [self.navigationController navigationBar].hidden = YES;
    
    // Check user session
    NSUserDefaults* coreDatabase = [NSUserDefaults standardUserDefaults];
    NSString *userEmail = [coreDatabase objectForKey:@"Current_User_Email"];
    if (userEmail) {
        [self performSegueWithIdentifier:@"toMainView" sender:self];
    }
    
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

#pragma mark - Network Element

- (IBAction)loginButtonClicked:(id)sender {
    
    [self.loginButton setEnabled:NO];
    
    NSString *useremail = self.userEmail.text;
    
    NSString *password = self.userPassword.text;
    
    if (([useremail isEqualToString:@""]) || ([password isEqualToString:@""])) {
        [self shakeView:self.loginBox];
        [self.loginButton setEnabled:YES];
    }
    else {
        
        [self.activityIndicator startAnimating];
        
        self.loginOperation = [ApplicationDelegate.networkOperations basicAuthentication:useremail andUserPassword:password];
    
        [self.loginOperation onCompletion:^(JUSSNetworkOperation *completedOperation) {
            
            result = [completedOperation responseString];
        
            if ([result isEqualToString:@"false"]) {
                
                [self.activityIndicator stopAnimating];
                
                [self.userEmail resignFirstResponder];
                [self.userPassword resignFirstResponder];
                OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Oppps.." message: @"Wrong username or password." timeout:1 dismissible:YES];
                [ghastly show];
                [self.userPassword setText:@""];
                
                [self.loginButton setEnabled:YES];
            
            }
            
            else if ([result isEqualToString:@"true"]) {
                [self.userEmail resignFirstResponder];
                [self.userPassword resignFirstResponder];
                
                // Create storage for this particular users
                NSString *currentUsersPath = [usersPath stringByAppendingPathComponent:useremail];
                
                NSString *currentCardPath = [currentUsersPath stringByAppendingPathComponent:@"Cards"];
                
                NSError *error;
                if (![[NSFileManager defaultManager] fileExistsAtPath:currentUsersPath])
                    [[NSFileManager defaultManager] createDirectoryAtPath:currentUsersPath withIntermediateDirectories:NO attributes:nil error:&error];
                
                if (![[NSFileManager defaultManager] fileExistsAtPath:currentCardPath])
                    [[NSFileManager defaultManager] createDirectoryAtPath:currentCardPath withIntermediateDirectories:NO attributes:nil error:&error];
                
                // Download the profile photo
                NSString *profilePhotoURL = [@"http://" stringByAppendingString:ApplicationDelegate.hostName];
                
                profilePhotoURL = [profilePhotoURL stringByAppendingString:@"/storage/users/"];
                
                profilePhotoURL = [profilePhotoURL stringByAppendingString:useremail];
                                   
                profilePhotoURL = [profilePhotoURL stringByAppendingString:@"/user_profile_photo.jpg"];
                                   
                
                NSString *profilePhotoPath = [currentUsersPath stringByAppendingPathComponent:@"user_profile_photo.jpg"];
                NSString *profileBackupPhotoPath = [currentUsersPath stringByAppendingPathComponent:@"user_profile_photo_backup.jpg"];
                
                
                self.downloadOperation = [ApplicationDelegate.downloadOperation downloadFile:profilePhotoURL toFile:profilePhotoPath];
                
                [self.downloadOperation onCompletion:^(JUSSNetworkOperation *completedOperation) {
                  
                    
                    [self.loginButton setEnabled:YES];
                    
                    // Fetch the user info
                    self.fetchUserInfo = [ApplicationDelegate.networkOperations fetchUserInfo:useremail];
                    [self.fetchUserInfo onCompletion:^(JUSSNetworkOperation *completedOperation) {
                        [self.loginButton setEnabled:NO];
                        [self dismissKeyboard:nil];
                        userInfo = [completedOperation responseJSON];
                        
                        // Create backup for profile photo
                        NSFileManager *fileManager = [NSFileManager defaultManager];
                        NSError *error;
                        [fileManager copyItemAtPath:profilePhotoPath toPath:profileBackupPhotoPath error:&error];
                        
                        // Set user session
                        NSUserDefaults* coreDatabase = [NSUserDefaults standardUserDefaults];
                        [coreDatabase setObject:useremail forKey:@"Current_User_Email"];
                        if (![[userInfo objectForKey:@"User_Nickname"] isKindOfClass:[NSNull class]]) {
                            [coreDatabase setObject:[userInfo objectForKey:@"User_Nickname"] forKey:[NSString stringWithFormat:@"%@_Nickname", useremail]];
                        }
                        
                        if (![[userInfo objectForKey:@"User_Status"] isKindOfClass:[NSNull class]]) {
                            [coreDatabase setObject:[userInfo objectForKey:@"User_Status"] forKey:[NSString stringWithFormat:@"%@_Status", useremail]];
                        }
                        
                        [coreDatabase setObject:currentUsersPath forKey:[NSString stringWithFormat:@"%@_User_Path", useremail]];
                        [coreDatabase setObject:currentCardPath forKey:[NSString stringWithFormat:@"%@_Card_Path", useremail]];
                        [coreDatabase setObject:profilePhotoURL forKey:[NSString stringWithFormat:@"%@_profilePhotoURL", useremail]];
                        [coreDatabase setObject:profilePhotoPath forKey:[NSString stringWithFormat:@"%@_profilePhotoPath", useremail]];
                        [coreDatabase setObject:profileBackupPhotoPath forKey:[NSString stringWithFormat:@"%@_profileBackupPhotoPath", useremail]];
                        [coreDatabase setObject:@"" forKey:[NSString stringWithFormat:@"%@_Color", useremail]];
                        [coreDatabase synchronize];
                        
                        [self performSegueWithIdentifier:@"toMainView" sender:self];
                        
                    } onError:^(NSError *error) {
                        [self.activityIndicator stopAnimating];
                        [self.loginButton setEnabled:YES];
                        [self.userEmail resignFirstResponder];
                        [self.userPassword resignFirstResponder];
                        OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Connection Error" message: @"Please check your internet connection" timeout:1 dismissible:YES];
                        [ghastly show];
                    }];

                    
                } onError:^(NSError *error) {
                    [self.activityIndicator stopAnimating];
                    [self.loginButton setEnabled:YES];
                    [self.userEmail resignFirstResponder];
                    [self.userPassword resignFirstResponder];
                    OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Connection Error" message: @"Please check your internet connection" timeout:1 dismissible:YES];
                    [ghastly show];
                }];
                
            }
            
            else {
                
                NSLog(@"%@", [completedOperation responseString]);
                OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Server Error" message: @"We are trying to get it back to work. Sorry for any inconvenince caused" timeout:1 dismissible:YES];
                [ghastly show];
                
                [self.loginButton setEnabled:YES];
            }
            
        } onError:^(NSError *error) {
            
            [self.activityIndicator stopAnimating];
            [self.userEmail resignFirstResponder];
            [self.userPassword resignFirstResponder];
            OLGhostAlertView *ghastly = [[OLGhostAlertView alloc] initWithTitle:@"Connection Error" message: @"Please check your internet connection" timeout:1 dismissible:YES];
            [ghastly show];
            result = [error localizedDescription];
            
            [self.loginButton setEnabled:YES];
            
        }];
        
    }
    
}

#pragma mark - Decoration

- (void) shakeView: (UIView *)aView {
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

- (IBAction)dismissKeyboard:(id)sender {
    [self.userEmail resignFirstResponder];
    [self.userPassword resignFirstResponder];
}
@end
