//
//  lifeWordsPhotoFilteringViewController.h
//  lifeWords
//
//  Created by JustaLiar on 23/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PhotoFX.h"
#import "MBProgressHUD.h"
#import "SWSnapshotStackView.h"

@interface lifeWordsPhotoFilteringViewController : UIViewController <MBProgressHUDDelegate> {
    
    // User Information
    NSString *userEmail;
    NSString *color;
    
    // Card Information
    NSString *currentCardPath;
}

#pragma mark - Photo Elements
@property (strong, nonatomic) IBOutlet UIImage *photo;
@property (strong, nonatomic) IBOutlet SWSnapshotStackView *corePhoto;

#pragma mark - Decoration
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet SWSnapshotStackView *container;
@property (strong, nonatomic) IBOutlet UIImageView *wallpaper;
@property (strong, nonatomic) NSUserDefaults *coreDatabase;
@end
