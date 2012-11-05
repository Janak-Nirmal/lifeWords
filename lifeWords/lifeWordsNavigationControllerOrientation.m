//
//  lifeWordsNavigationControllerOrientation.m
//  lifeWords
//
//  Created by JustaLiar on 4/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsNavigationControllerOrientation.h"

@interface lifeWordsNavigationControllerOrientation ()

@end

@implementation lifeWordsNavigationControllerOrientation

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    
    return [self.visibleViewController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations {
    return [self.visibleViewController supportedInterfaceOrientations];
}



@end
