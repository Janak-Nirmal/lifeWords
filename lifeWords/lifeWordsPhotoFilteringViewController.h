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

@interface lifeWordsPhotoFilteringViewController : UIViewController <MBProgressHUDDelegate>

#pragma mark - Decoration
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImage *photo;
@property (strong, nonatomic) IBOutlet UIImageView *corePhoto;

@end
