//
//  lifeWordsTimeLineViewController.h
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPUserResizableView.h"

@interface lifeWordsTimeLineViewController : UIViewController

#pragma mark - Data Elements
@property (strong, nonatomic) IBOutlet UIButton *musicBtn;
@property (strong, nonatomic) IBOutlet UIImageView *test;


#pragma mark - The Time Line
@property (strong, nonatomic) IBOutlet SPUserResizableView *musicComponent;

@end
