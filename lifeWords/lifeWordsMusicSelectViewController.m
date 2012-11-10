//
//  lifeWordsMusicSelectViewController.m
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsMusicSelectViewController.h"
#import "lifeWordsMusicDetailViewController.h"

@interface lifeWordsMusicSelectViewController ()

@end

@implementation lifeWordsMusicSelectViewController

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
    
    categoryArray = [[NSMutableArray alloc] init];
    
    NSArray *classical = [NSArray arrayWithObjects:@"Classical", @"Classical sound for classical moments", @"category-classical.jpg", nil];
    NSArray *easeful = [NSArray arrayWithObjects:@"Easeful", @"Easeful sound, ease your soul", @"category-easeful.jpg", nil];
    NSArray *joyful = [NSArray arrayWithObjects:@"Joyful", @"Rock your life with joyful sound", @"category-joyful.jpg", nil];
    NSArray *memories = [NSArray arrayWithObjects:@"Memories", @"Bring back the old time", @"category-memories.jpg", nil];
    NSArray *romantic = [NSArray arrayWithObjects:@"Romatic", @"Use for lovers, created by lovers", @"category-romantic.jpg", nil];
    
    [categoryArray addObject:classical];
    [categoryArray addObject:easeful];
    [categoryArray addObject:joyful];
    [categoryArray addObject:memories];
    [categoryArray addObject:romantic];
    
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
    [self setCategory:nil];
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
    return [categoryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CategoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[categoryArray objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.detailTextLabel.text = [[categoryArray objectAtIndex:indexPath.row] objectAtIndex:1];
    cell.imageView.image = [UIImage imageNamed:[[categoryArray objectAtIndex:indexPath.row] objectAtIndex:2]];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setCategory:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    lifeWordsMusicDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"musicDetailView"];
    [vc setCategory:self.category];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
