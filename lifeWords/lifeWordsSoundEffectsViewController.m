//
//  lifeWordsSoundEffectsViewController.m
//  lifeWords
//
//  Created by JustaLiar on 9/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsSoundEffectsViewController.h"

@interface lifeWordsSoundEffectsViewController ()

@end

@implementation lifeWordsSoundEffectsViewController

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
    
    soundEffects = [[NSMutableArray alloc] init];
    
    [soundEffects addObject:[NSArray arrayWithObjects:@"Birds Sounds", @"02:53", nil]];
    [soundEffects addObject:[NSArray arrayWithObjects:@"Crowds Noise", @"02:58", nil]];
    [soundEffects addObject:[NSArray arrayWithObjects:@"Forest", @"02:59", nil]];
    [soundEffects addObject:[NSArray arrayWithObjects:@"Heavy Rain", @"02:55", nil]];
    [soundEffects addObject:[NSArray arrayWithObjects:@"Lighting Strike and Thunder", @"02:58", nil]];
    [soundEffects addObject:[NSArray arrayWithObjects:@"Rain in a window", @"02:59", nil]];
    [soundEffects addObject:[NSArray arrayWithObjects:@"Rain", @"02:59", nil]];
    [soundEffects addObject:[NSArray arrayWithObjects:@"Tropical Rainforest", @"02:59", nil]];
    [soundEffects addObject:[NSArray arrayWithObjects:@"Waterfall", @"02:59", nil]];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [soundEffects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EffectsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[soundEffects objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.detailTextLabel.text = [[soundEffects objectAtIndex:indexPath.row] objectAtIndex:1];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Effect Selected" object:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
}

@end
