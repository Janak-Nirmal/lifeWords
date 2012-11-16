//
//  lifeWordsTimeLineViewController.h
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPUserResizableView.h"
#import <AVFoundation/AVFoundation.h>
#import "YLProgressBar.h"
#import "SWSnapshotStackView.h"

@interface lifeWordsTimeLineViewController : UIViewController <UIGestureRecognizerDelegate, UIPopoverControllerDelegate, AVAudioPlayerDelegate, AVAudioRecorderDelegate, SPUserResizableViewDelegate> {
    
    // Record View Variables
    AVAudioRecorder *recorder;
    AVAudioPlayer *recorderPlayer;
    NSTimer *recorderTimer;
    NSTimer *recorderPlayerTimer;
    NSURL *recordURL;
    
    // Card TimeLine Components
    NSURL *musicComponent;
    NSURL *soundEffectComponent;
    NSURL *voiceComponent;
    
    // User Information
    NSString *userEmail;
    NSString *color;
    
    // Resizeable View
    SPUserResizableView *musicAudioWave;
    SPUserResizableView *currentlyEditingView;
    SPUserResizableView *lastEditedView;
}

@property (nonatomic, strong) UIPopoverController *popover;


#pragma mark - Decoration
@property (strong, nonatomic) IBOutlet SWSnapshotStackView *container;
@property (strong, nonatomic) IBOutlet UIImageView *wallpaper;
@property (strong, nonatomic) IBOutlet UIView *musicView;


#pragma mark - Data Elements
@property (strong, nonatomic) NSUserDefaults *coreDatabase;
@property (strong, nonatomic) NSString *currentCardPath;
@property (strong, nonatomic) IBOutlet UITextField *cardTitle;
@property (strong, nonatomic) IBOutlet UITextField *cardDate;
@property (strong, nonatomic) IBOutlet UITextField *cardLength;

#pragma mark - The Time Line
@property (strong, nonatomic) IBOutlet UIButton *musicBtn;
@property (strong, nonatomic) IBOutlet UIButton *effectsBtn;
@property (strong, nonatomic) AVAudioPlayer *musicPlayer;
@property (strong, nonatomic) AVAudioPlayer *effectPlayer;
@property (strong, nonatomic) AVAudioPlayer *voicePlayer;


// Record View
@property (strong, nonatomic) IBOutlet UIView *recordView;
@property (strong, nonatomic) IBOutlet YLProgressBar *recordMeter1;
@property (strong, nonatomic) IBOutlet YLProgressBar *recordMeter2;
@property (strong, nonatomic) IBOutlet UIButton *recordBtn;
@property (strong, nonatomic) IBOutlet UIButton *recordCancelBtn;
@property (strong, nonatomic) IBOutlet UIButton *recordPlayBtn;
@property (strong, nonatomic) IBOutlet UIButton *recordAcceptBtn;
@property (strong, nonatomic) IBOutlet UIButton *recordRecBtn;


#pragma mark - Actions
- (IBAction)test:(id)sender;

- (IBAction)musicBtnClicked:(id)sender;
- (IBAction)effectsBtnClicked:(id)sender;

// Record View Actions
- (IBAction)recordBtnClicked:(id)sender;
- (IBAction)recordCancelBtnClicked:(id)sender;
- (IBAction)recordPlayBtnClicked:(id)sender;
- (IBAction)recordAcceptBtnClicked:(id)sender;
- (IBAction)recordRecBtnClicked:(id)sender;
@end
