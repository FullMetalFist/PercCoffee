//
//  PCOBeverageDetailTableViewController.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeverageDetailTableViewController.h"

#import "Cells/PCOBeverageName.h"
#import "Cells/PCOBeverageDetail.h"
#import "UIColor+Coffee.h"
#import "PCOBeverageModel.h"

NSString *const kNameIdentifier = @"Name";
NSString *const kDetailIdentifier = @"Detail";

@interface PCOBeverageDetailTableViewController ()

@end

@implementation PCOBeverageDetailTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *titleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dripWhite"]];
//    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shareButton"] style:UIBarButtonItemStylePlain target:self action:@selector(share)];
//    self.navigationItem.rightBarButtonItem = shareButton;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleImage;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[PCOBeverageName class] forCellReuseIdentifier:kNameIdentifier];
    [self.tableView registerClass:[PCOBeverageDetail class] forCellReuseIdentifier:kDetailIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    if (indexPath.row == 0) {
        PCOBeverageName *cell = [tableView dequeueReusableCellWithIdentifier:kNameIdentifier forIndexPath:indexPath];
        cell.name.text = self.beverageModel.name;
        return cell;
    }
    else
    {
        PCOBeverageDetail *cell = [tableView dequeueReusableCellWithIdentifier:kDetailIdentifier forIndexPath:indexPath];
        cell.descLong.text = self.beverageModel.descLong;
        //cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.beverageModel.imageURL]];
        //cell.lastUpdated.text = [NSDateFormatter self.beverageModel.lastUpdated;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 60.0;
    }
    else {
        return 300.0;
    }
}

#pragma mark -- UIBarButtonItem

- (void) share
{
    NSLog(@"share button pressed!");
}



@end
