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
    NSArray *classical = [NSArray arrayWithObjects:@"Classical", @"Classical sound for classical moments", nil];
    [musicArray addObject:classical];
    
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
