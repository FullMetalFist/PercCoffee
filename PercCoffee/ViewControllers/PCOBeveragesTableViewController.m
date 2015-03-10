//
//  PCOBeveragesTableViewController.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeveragesTableViewController.h"
#import "PCOBeverageDetailTableViewController.h"
#import "PCOBeverageStore.h"
#import "PCOBeverageModel.h"
#import "Cells/PCOBeverageTableViewCell.h"

NSString *const CoffeeIdentifier = @"CoffeeIdentifier";
NSString *const Detail = @"Detail";

@interface PCOBeveragesTableViewController ()

@property (nonatomic) UIActivityIndicatorView   *spinner;

@end

@implementation PCOBeveragesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.beverageList = [NSArray array];
    UIImageView *titleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dripWhite"]];
    self.navigationItem.titleView = titleImage;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CoffeeIdentifier];
    self.beverageStore = [PCOBeverageStore sharedBeverageStore];
    [self.tableView registerClass:[PCOBeverageTableViewCell class] forCellReuseIdentifier:CoffeeIdentifier];
    [self.beverageStore loadBeveragesWithCompletion:^{
        [self.beverageStore loadAllBeverageDetails];
        [self.spinner stopAnimating];
        [self.tableView reloadData];
    }];
}

- (void)startActivitySpinner {
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.spinner.center = CGPointMake(160, 240);
    self.spinner.hidesWhenStopped = YES;
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.beverageStore.beverages count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PCOBeverageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CoffeeIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PCOBeverageModel *beverage = self.beverageStore.beverages[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = beverage.name;
//    cell.textLabel.font = [cell.name.font fontWithSize:12.0f];
//    cell.name.text = beverage.name;
//    cell.name.font = [cell.name.font fontWithSize:20.0];
//    cell.descShort.text = beverage.descShort;
//    if (beverage.imageURL) {
//        NSURL *url = beverage.imageURL;
//        cell.picture.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PCOBeverageModel *beverage = self.beverageStore.beverages[(int)indexPath.row];
    PCOBeverageDetailTableViewController *nextVC = [[PCOBeverageDetailTableViewController alloc] init];
    nextVC.beverageModel = beverage;
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
