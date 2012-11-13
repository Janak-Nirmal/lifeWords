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

@interface lifeWordsTimeLineViewController : UIViewController <UIPopoverControllerDelegate, AVAudioPlayerDelegate, AVAudioRecorderDelegate> {
    
    // Record View Variables
    AVAudioRecorder *recorder;
    AVAudioPlayer *recorderPlayer;
    NSTimer *recorderTimer;
    NSTimer *recorderPlayerTimer;
    NSURL *recordURL;
    
    // TimeLine Components
    NSString *musicComponent;
    NSString *soundEffectComponent;
    NSString *voiceComponent;
    
    
}

@property (nonatomic, strong) UIPopoverController *popover;

#pragma mark - Data Elements
@property (strong, nonatomic) IBOutlet UITextField *cardTitle;
@property (strong, nonatomic) IBOutlet UITextField *cardDate;
@property (strong, nonatomic) IBOutlet UITextField *cardLength;

#pragma mark - The Time Line
@property (strong, nonatomic) IBOutlet UIButton *musicBtn;
@property (strong, nonatomic) IBOutlet UIButton *effectsBtn;

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

- (IBAction)musicBtnClicked:(id)sender;
- (IBAction)effectsBtnClicked:(id)sender;

// Record View Actions
- (IBAction)recordBtnClicked:(id)sender;
- (IBAction)recordCancelBtnClicked:(id)sender;
- (IBAction)recordPlayBtnClicked:(id)sender;
- (IBAction)recordAcceptBtnClicked:(id)sender;
- (IBAction)recordRecBtnClicked:(id)sender;
@end
