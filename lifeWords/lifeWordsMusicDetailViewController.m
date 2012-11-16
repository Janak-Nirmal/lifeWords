//
//  lifeWordsMusicDetailViewController.m
//  lifeWords
//
//  Created by JustaLiar on 8/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsMusicDetailViewController.h"

@interface lifeWordsMusicDetailViewController ()

@end

@implementation lifeWordsMusicDetailViewController

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
    musicArray = [[NSMutableArray alloc] init];
    
    if ([self.category isEqualToString:@"Classical"]) {
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.3-IV", @"02:59", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.4-III", @"02:54", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.7-III", @"02:41", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.7-IV", @"02:04", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.8-II", @"02:55", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.8-III", @"02:35", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.10-I", @"03:00", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.10-II", @"01:52", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.10-III", @"02:21", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.20-I", @"02:41", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.20-II", @"02:15", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Piano Sonata No.29-II", @"02:35", nil]];
    }
    else if ([self.category isEqualToString:@"Easeful"]) {
        [musicArray addObject:[NSArray arrayWithObjects:@"Final Fantasy - Wish", @"02:54", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Ib - Departure", @"01:27", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Ib - Doll", @"02:14", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Johann Pachelbel Canon in D", @"02:46", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Rhythm Thief - An Ayria", @"02:35", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Rhythm Thief - Moon Princess", @"02:10", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Rhythm Thief - Raphael", @"00:57", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Wolfgang Amadeus Mozart - Symphony", @"02:54", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Zelda's Lullaby", @"02:05", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Zelda's Theme", @"02:45", nil]];
    }
    else if ([self.category isEqualToString:@"Joyful"]) {
        [musicArray addObject:[NSArray arrayWithObjects:@"Benny Goodman & His Orchestra - Sing Sing Sing", @"02:58", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Depapepe - Fun Time", @"02:57", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Depapepe - Snow Dance", @"02:52", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Depapepe - Start", @"01:45", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Depapepe - Summer Parade", @"02:47", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Ib - Hide And Seek", @"00:59", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Rhythm Thief - Maria", @"00:59", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Rhythm Thief - Shall We Dance", @"02:13", nil]];
    }
    else if ([self.category isEqualToString:@"Memories"]) {
        [musicArray addObject:[NSArray arrayWithObjects:@"Depapepe - One", @"02:37", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Final Fantasy VI - Terra Tina", @"02:47", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Ib - Blind Alley", @"02:02", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Ib - Prelude", @"01:24", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Ib - Puppet", @"02:45", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Legend of Zelda - Kakariko Village", @"02:47", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Hope", @"02:48", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - If I Could See You Again", @"02:32", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Maybe", @"02:38", nil]];
    }
    else {
        [musicArray addObject:[NSArray arrayWithObjects:@"Final Fantasy - Tifa's Theme", @"02:10", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"The Piano Melody", @"02:15", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - A River Flows In You", @"02:56", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Beloved", @"02:39", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Chaconne", @"02:31", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Destiny Of Love", @"02:50", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Kiss The Rain", @"02:39", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Love Me", @"02:59", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Moonlight", @"02:52", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Tears On Love", @"02:59", nil]];
        [musicArray addObject:[NSArray arrayWithObjects:@"Yiruma - Time Forgets", @"02:20", nil]];
    }
    
	// Do any additional setup after loading the view.
}

- (void) viewDidUnload {
    [super viewDidUnload];
    [self setCategory:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [musicArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MusicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[musicArray objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.detailTextLabel.text = [[musicArray objectAtIndex:indexPath.row] objectAtIndex:1];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Music Selected" object:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
}


@end
