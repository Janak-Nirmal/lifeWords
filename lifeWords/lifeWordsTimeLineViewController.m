//
//  lifeWordsTimeLineViewController.m
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#define XMAX	20.0f

#import "lifeWordsTimeLineViewController.h"
#import "lifeWordsMusicSelectViewController.h"
#import "lifeWordsSoundEffectsViewController.h"
#import "WaveformImageView.h"
#import "MBProgressHUD.h"
#import "KSCustomPopoverBackgroundView.h"

@interface lifeWordsTimeLineViewController ()

@end

@implementation lifeWordsTimeLineViewController

#pragma mark - UIViewController Life Cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set record settings
    recordURL = [self recordURL];
    
    // Recording settings
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings setValue: [NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
	[settings setValue: [NSNumber numberWithFloat:16000.0] forKey:AVSampleRateKey];
	[settings setValue: [NSNumber numberWithInt: 1] forKey:AVNumberOfChannelsKey]; // mono
	[settings setValue: [NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
	[settings setValue: [NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
	[settings setValue: [NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
    
    recorder = [[AVAudioRecorder alloc] initWithURL:recordURL settings:settings error:nil];
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
    
    
    // Set current date for date textbox
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd MMMM YYYY"];
    NSString *dateString = [dateFormat stringFromDate:date];
    [self.cardDate setText:dateString];
    
    // Beautify Record View
    [self.recordView.layer setCornerRadius:10.0f];
    [self.recordView setAlpha:0.8f];
    [self.recordView.layer setShadowRadius:5.0f];
    [self.recordMeter1 setProgressTintColor:[UIColor greenColor]];
    [self.recordMeter2 setProgressTintColor:[UIColor redColor]];

    //NSURL *url = [[NSBundle mainBundle] URLForResource:@"Doll" withExtension:@"mp3"];
    //NSLog(@"%@", url.absoluteString);
    //AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
    //WaveformImageView *imageView = [[WaveformImageView alloc] initWithUrl:url];
    //self.test.image = imageView.image;
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotificationFromMusicSelect:) name:@"Music Selected" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotificationFromEffectSelect:) name:@"Effect Selected" object:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [[NSNotificationCenter defaultCenter] removeObject:self];
}
     
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload {
    [self setMusicBtn:nil];
    [self setPopover:nil];
    [self setEffectsBtn:nil];
    [self setCardTitle:nil];
    [self setCardDate:nil];
    [self setCardLength:nil];
    [self setRecordBtn:nil];
    [self setRecordView:nil];
    [self setRecordMeter1:nil];
    [self setRecordMeter2:nil];
    [self setRecordCancelBtn:nil];
    [self setRecordPlayBtn:nil];
    [self setRecordAcceptBtn:nil];
    [self setRecordRecBtn:nil];
    [super viewDidUnload];
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

#pragma mark - Time Line Components
- (IBAction)musicBtnClicked:(id)sender {
    lifeWordsMusicSelectViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"musicSelectView"];
    self.popover = [[UIPopoverController alloc] initWithContentViewController:vc];
    self.popover.popoverBackgroundViewClass = [KSCustomPopoverBackgroundView class];
    [self.popover presentPopoverFromRect:self.musicBtn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    self.popover.delegate = self;
}

- (IBAction)effectsBtnClicked:(id)sender {
    lifeWordsSoundEffectsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"soundEffectsView"];
    self.popover = [[UIPopoverController alloc] initWithContentViewController:vc];
    self.popover.popoverBackgroundViewClass = [KSCustomPopoverBackgroundView class];
    [self.popover presentPopoverFromRect:self.effectsBtn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    self.popover.delegate = self;
}

#pragma mark - Time Line Actions
- (void) handleNotificationFromMusicSelect: (NSNotification *)pNotification {
    [self.popover dismissPopoverAnimated:YES];
}

- (void) handleNotificationFromEffectSelect: (NSNotification *)pNotification {
    [self.popover dismissPopoverAnimated:YES];
}

#pragma mark - UIPopoverControllerDelegate
- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    return YES;
}

#pragma mark - Record View

- (IBAction)recordBtnClicked:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        [self.recordView setFrame:CGRectMake(151, self.recordView.frame.origin.y, self.recordView.frame.size.width, self.recordView.frame.size.height)];
    } completion:^(BOOL finished) {
        
    }];
}

- (NSURL *) recordURL
{
    NSString *outputPath = [[NSString alloc] initWithFormat:@"%@%@", NSTemporaryDirectory(), @"recording.wav"];
    NSURL *outputURL = [[NSURL alloc] initFileURLWithPath:outputPath];
    NSFileManager *manager = [[NSFileManager alloc] init];
    if ([manager fileExistsAtPath:outputPath])
    {
        [manager removeItemAtPath:outputPath error:nil];
    }
    return outputURL;
}

- (IBAction)recordCancelBtnClicked:(id)sender {
    recorderPlayer = nil;
    [UIView animateWithDuration:0.5 animations:^{
        [self.recordView setFrame:CGRectMake(768, self.recordView.frame.origin.y, self.recordView.frame.size.width, self.recordView.frame.size.height)];
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)recordPlayBtnClicked:(id)sender {
    NSFileManager *manager = [[NSFileManager alloc] init];
    NSString *outputPath = [[NSString alloc] initWithFormat:@"%@%@", NSTemporaryDirectory(), @"recording.wav"];
    if (![recorderPlayer isPlaying])
    {
        if ([manager fileExistsAtPath:outputPath])
        {
            recorderPlayerTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updatePlayerMeters) userInfo:nil repeats:YES];
            [recorderPlayerTimer fire];
            
            [recorderPlayer play];
            [self.recordPlayBtn setTitle:@"Stop" forState:UIControlStateNormal];
        }
    }
    else
    {
        [recorderPlayer stop];
        [recorderPlayerTimer invalidate];
        [self.recordPlayBtn setTitle:@"Play" forState:UIControlStateNormal];
        self.recordMeter1.progress = 0;
        self.recordMeter2.progress = 0;
    }

}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if ([self.recordPlayBtn.titleLabel.text isEqualToString:@"Stop"]) {
        [self.recordPlayBtn setTitle:@"Play" forState:UIControlStateNormal];
        [recorderPlayerTimer invalidate];
        self.recordMeter1.progress = 0;
        self.recordMeter2.progress = 0;
    }
}

- (IBAction)recordAcceptBtnClicked:(id)sender {
}

- (IBAction)recordRecBtnClicked:(id)sender {
    
    
    if ([recorder isRecording])
    {
        [recorder stop];
        [recorderTimer invalidate];
        [self.recordRecBtn setTitle:@"Record" forState:UIControlStateNormal];
        [self.recordPlayBtn setEnabled:YES];
        [self.recordAcceptBtn setEnabled:YES];
        
        recorderPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:recordURL error:nil];
        recorderPlayer.meteringEnabled = YES;
        recorderPlayer.delegate = self;
        
        self.recordMeter1.progress = 0;
        self.recordMeter2.progress = 0;
        
    }
    else
    {
        recorderTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateMeters) userInfo:nil repeats:YES];
        [recorderTimer fire];
        [recorder recordForDuration:180];
        [self.recordRecBtn setTitle:@"Stop" forState:UIControlStateNormal];
        [self.recordPlayBtn setEnabled:NO];
        [self.recordAcceptBtn setEnabled:NO];
        
    }
}


- (void) updateMeters
{
	// Show the current power levels
	[recorder updateMeters];
	float avg = [recorder averagePowerForChannel:0];
	float peak = [recorder peakPowerForChannel:0];
    float progress1 = (XMAX + avg) / XMAX;
    float progress2 = (XMAX + peak) / XMAX;
    
    if (progress1 <= 0.6 ) {
        [self.recordMeter1 setProgressTintColor:[UIColor greenColor]];
    }
    else if (progress1 <= 0.8) {
        [self.recordMeter1 setProgressTintColor:[UIColor orangeColor]];
    }
    else {
        [self.recordMeter1 setProgressTintColor:[UIColor redColor]];
    }
    
    if (progress2 <= 0.6 ) {
        [self.recordMeter2 setProgressTintColor:[UIColor greenColor]];
    }
    else if (progress2 <= 0.8) {
        [self.recordMeter2 setProgressTintColor:[UIColor orangeColor]];
    }
    else {
        [self.recordMeter2 setProgressTintColor:[UIColor redColor]];
    }
	self.recordMeter1.progress = (XMAX + avg) / XMAX;
	self.recordMeter2.progress = (XMAX + peak) / XMAX;

}

- (void) updatePlayerMeters
{
	// Show the current power levels
	[recorderPlayer updateMeters];
	float avg = [recorderPlayer averagePowerForChannel:0];
	float peak = [recorderPlayer peakPowerForChannel:0];
    float progress1 = (XMAX + avg) / XMAX;
    float progress2 = (XMAX + peak) / XMAX;
    
    if (progress1 <= 0.6 ) {
        [self.recordMeter1 setProgressTintColor:[UIColor greenColor]];
    }
    else if (progress1 <= 0.8) {
        [self.recordMeter1 setProgressTintColor:[UIColor orangeColor]];
    }
    else {
        [self.recordMeter1 setProgressTintColor:[UIColor redColor]];
    }
    
    if (progress2 <= 0.6 ) {
        [self.recordMeter2 setProgressTintColor:[UIColor greenColor]];
    }
    else if (progress2 <= 0.8) {
        [self.recordMeter2 setProgressTintColor:[UIColor orangeColor]];
    }
    else {
        [self.recordMeter2 setProgressTintColor:[UIColor redColor]];
    }
	self.recordMeter1.progress = (XMAX + avg) / XMAX;
	self.recordMeter2.progress = (XMAX + peak) / XMAX;
    
}

@end
