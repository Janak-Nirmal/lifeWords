//
//  lifeWordsTimeLineViewController.m
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsTimeLineViewController.h"
#import "WaveformImageView.h"
#import "MBProgressHUD.h"

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
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Doll" withExtension:@"mp3"];
    NSLog(@"%@", url.absoluteString);
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
    WaveformImageView *imageView = [[WaveformImageView alloc] initWithUrl:url];
    self.test.image = imageView.image;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload {
    [self setMusicBtn:nil];
    [self setMusicComponent:nil];
    [self setTest:nil];
    [super viewDidUnload];
}
@end
