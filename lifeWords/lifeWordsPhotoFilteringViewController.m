//
//  lifeWordsPhotoFilteringViewController.m
//  lifeWords
//
//  Created by JustaLiar on 23/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsPhotoFilteringViewController.h"
#import "UIImage+Helpers.h"

@interface lifeWordsPhotoFilteringViewController () {
    MBProgressHUD *HUD;
    UIImage *originalPhoto;
}

@end

@implementation lifeWordsPhotoFilteringViewController

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
    self.photo = [self.photo normalizedImage];
    self.corePhoto.image = self.photo;
    originalPhoto = self.corePhoto.image;
    [self effectPanel];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Create a new barbutton with an action
    UIBarButtonItem *barbutton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                  style:UIBarButtonItemStyleBordered target:self action:@selector(backBarPressed)];
    
    // and put the button in the nav bar
    self.navigationItem.leftBarButtonItem = barbutton;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    // Show navigation bar
    [self.navigationController navigationBar].hidden = NO;
    
    // Set back button title
    
    
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setPhoto:nil];
    [self setCorePhoto:nil];
    [super viewDidUnload];
}

#pragma mark - PhotoFX Effects

-(void)fillScrollView:(NSArray *)_array {
    
    int lastX = 10;
    int index = 1;
    for (NSString *name in _array)
    {
        
        UIImage *_image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", name]];

        CGRect thumRect;
        
        UIImageView *thImage;
        UILabel *tv;
        
        thumRect = CGRectMake(lastX, 0, 72, 51);
        thImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 74, 53)];
        tv = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 74, 20)];
        
        UIControl *thumbImageButton = [[UIControl alloc] initWithFrame:thumRect];
        thumbImageButton.backgroundColor = [UIColor clearColor];
        
        thumbImageButton.tag = index;
        
        thImage.image = _image;
        
        thImage.layer.cornerRadius = 10.0f;
        
        [tv setText:name];
        [tv setFont:[UIFont fontWithName:@"Helvetica" size:9.0]];
        [tv setTextAlignment:NSTextAlignmentCenter];
        [tv setBackgroundColor:[UIColor clearColor]];
        [tv setTextColor:[UIColor blackColor]];
        
        
        
        [thumbImageButton addSubview:thImage];
        [thumbImageButton addSubview:tv];
        [thumbImageButton addTarget:self action:@selector(applyFX:) forControlEvents:UIControlEventTouchUpInside];
    
        [self.scrollView addSubview:thumbImageButton];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            lastX = lastX + 80;
            [self.scrollView setContentSize:CGSizeMake(lastX, 60)];
        } else {
            lastX = lastX + 100;
            [self.scrollView setContentSize:CGSizeMake(lastX, 120)];
        }
        
        index += 1;
        
    }
    
}

- (void) effectPanel {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self.scrollView setContentSize:CGSizeMake(500, 70)];
    } else {
        [self.scrollView setContentSize:CGSizeMake(500, 120)];
    }
    
    
    [self.scrollView setPagingEnabled:YES];
    
    NSArray *effects = [NSArray arrayWithObjects:
                        @"Aged",
                        @"Lindale",
                        @"Sonoma",
                        @"Socorro",
                        @"Daytona",
                        @"Altamonte",
                        @"BWGrained",
                        @"OldDirty",
                        @"PaperToss",
                        @"Marine",
                        @"RedNoir",
                        @"SapphireNoir",
                        @"SepiaNoir",
                        @"YellowNoir",
                        @"Winter",
                        @"Mars",
                        @"BWLumino",
                        @"Napa",
                        @"DarkGrunge",
                        @"GrungeRaysSapia",
                        @"GrungeRaysRed",
                        @"GrungeRaysGreen",
                        @"GrungeRaysBlue",
                        @"Avatar",
                        @"ComicSharp",
                        @"ComicDark",
                        @"HalftoneSharp",
                        @"HalftoneComic",
                        @"HalftoneDark",
                        @"Alaska",
                        @"Derby",
                        @"Dusk",
                        @"Dawn",
                        @"Vivid",
                        @"Senibel",
                        @"Auto-Enhance",
                        @"Lantana",
                        @"Bilboa",
                        nil];
    
    
    [self fillScrollView:effects];
}

- (void)applyFX:(UIControl*)selectedControl  {
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.labelText = @"Processing...";
    [HUD showWhileExecuting:@selector(doApplyFX:) onTarget:self withObject:selectedControl animated:YES];
}

- (void)doApplyFX:(UIControl *)selectedControl {
    
    UIImage *_img;
    UIImage *imageToFilter = [self.corePhoto image];
    
    int _id = selectedControl.tag;
    switch (_id) {
        case 1:
            _img = [AgedFX applyEffect:imageToFilter];
            break;
        case 2:
            _img = [LindaleFX applyEffect:imageToFilter];
            break;
        case 3:
            _img = [SonomaFX applyEffect:imageToFilter];
            break;
        case 4:
            _img = [SocorroFX applyEffect:imageToFilter];
            break;
        case 5:
            _img = [DaytonaFX applyEffect:imageToFilter];
            break;
        case 6:
            _img = [AltamonteFX applyEffect:imageToFilter];
            break;
        case 7:
            _img = [BlackAndWhiteGrainedFX applyEffect:imageToFilter];
            break;
        case 8:
            _img = [OldDirtyFX applyEffect:imageToFilter];
            break;
        case 9:
            _img = [PaperTossFX applyEffect:imageToFilter];
            break;
        case 10:
            _img = [MarineFX applyEffect:imageToFilter];
            break;
        case 11:
            _img = [RedNoirFX applyEffect:imageToFilter];
            break;
        case 12:
            _img = [SapphireNoirFX applyEffect:imageToFilter];
            break;
        case 13:
            _img = [SepiaNoirFX applyEffect:imageToFilter];
            break;
        case 14:
            _img = [YellowNoirFX applyEffect:imageToFilter];
            break;
        case 15:
            _img = [WinterFX applyEffect:imageToFilter];
            break;
        case 16:
            _img = [MarsFX applyEffect:imageToFilter];
            break;
        case 17:
            _img = [BlackAndWhiteLuminoFX applyEffect:imageToFilter];
            break;
        case 18:
            _img = [NapaFX applyEffect:imageToFilter];
            break;
        case 19:
            _img = [DarkGrungeFX applyEffect:imageToFilter];
            break;
        case 20:
            _img = [GrungeRaysSapiaFX applyEffect:imageToFilter];
            break;
        case 21:
            _img = [GrungeRaysRedFX applyEffect:imageToFilter];
            break;
        case 22:
            _img = [GrungeRaysGreenFX applyEffect:imageToFilter];
            break;
        case 23:
            _img = [GrungeRaysBlueFX applyEffect:imageToFilter];
            break;
        case 24:
            _img = [AvatarFX applyEffect:imageToFilter];
            break;
        case 25:
            _img = [ComicSharpFX applyEffect:imageToFilter];
            break;
        case 26:
            _img = [ComicDarkFX applyEffect:imageToFilter];
            break;
        case 27:
            _img = [HalftoneSharpFX applyEffect:imageToFilter];
            break;
        case 28:
            _img = [HalftoneComicFX applyEffect:imageToFilter];
            break;
        case 29:
            _img = [HalftoneDarkFX applyEffect:imageToFilter];
            break;
        case 30:
            _img = [AlaskaFX applyEffect:imageToFilter];
            break;
        case 31:
            _img = [DerbyFX applyEffect:imageToFilter];
            break;
        case 32:
            _img = [DuskFX applyEffect:imageToFilter];
            break;
        case 33:
            _img = [DawnFX applyEffect:imageToFilter];
            break;
        case 34:
            _img = [VividFX applyEffect:imageToFilter];
            break;
        case 35:
            _img = [SenibelFX applyEffect:imageToFilter];
            break;
        case 36:
            _img = [EnhanceFX applyEffect:imageToFilter];
            break;
        case 37:
            _img = [LantanaFX applyEffect:imageToFilter];
            break;
        case 38:
            _img = [BilboaFX applyEffect:imageToFilter];
            break;
        default:
            break;
    }
    
    self.corePhoto.image = _img;
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
	HUD = nil;
}

- (void) backBarPressed
{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                     }];
    [self.navigationController popViewControllerAnimated:NO];
    
}


@end
