//
//  lifeWordsMusicSelectViewController.h
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lifeWordsMusicSelectViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *categoryArray;
}

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) id delegate;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
