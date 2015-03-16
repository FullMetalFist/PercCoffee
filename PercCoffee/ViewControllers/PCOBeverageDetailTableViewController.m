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

#define kNameHeight 60.0f
#define kDetailHeight 390.0f

NSString *const kNameIdentifier = @"Name";
NSString *const kDetailIdentifier = @"Detail";

@interface PCOBeverageDetailTableViewController ()

@end

@implementation PCOBeverageDetailTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creation];
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
        cell.beverage.descLong = self.beverageModel.descLong;
        cell.beverage.imageURLString = self.beverageModel.imageURLString;
        cell.beverage.lastUpdated = [NSString stringWithFormat:@"Updated: %@", self.beverageModel.lastUpdated];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return kNameHeight;
    }
    else {
        return kDetailHeight;
    }
}

#pragma mark -- UIViews creation

- (void) creation
{
    UIImageView *titleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dripWhite"]];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"SHARE" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.frame = CGRectMake(10, 0, 90, 40);
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.borderWidth = 1.0f;
    [button addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = shareButton;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleImage;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [self.tableView registerClass:[PCOBeverageName class] forCellReuseIdentifier:kNameIdentifier];
    [self.tableView registerClass:[PCOBeverageDetail class] forCellReuseIdentifier:kDetailIdentifier];
}

- (void) share
{
    NSLog(@"share button pressed!");
}

@end
