//
//  lifeWordsTimeLineViewController.h
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPUserResizableView.h"

@interface lifeWordsTimeLineViewController : UIViewController <UIPopoverControllerDelegate>

#pragma mark - Data Elements
@property (strong, nonatomic) IBOutlet UITextField *cardTitle;
@property (strong, nonatomic) IBOutlet UITextField *cardDate;
@property (strong, nonatomic) IBOutlet UITextField *cardLength;

@property (strong, nonatomic) IBOutlet UIButton *musicBtn;
@property (strong, nonatomic) IBOutlet UIButton *effectsBtn;
@property (nonatomic, strong) UIPopoverController *popover;



#pragma mark - The Time Line
@property (strong, nonatomic) IBOutlet SPUserResizableView *musicComponent;

- (IBAction)musicBtnClicked:(id)sender;
- (IBAction)effectsBtnClicked:(id)sender;
@end
