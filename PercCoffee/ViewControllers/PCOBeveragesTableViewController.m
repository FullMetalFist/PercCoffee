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

#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

const CGFloat kCellContentMargin = 10.0f;
const CGFloat kCellHeight = 350.0f;

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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PCOBeverageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CoffeeIdentifier forIndexPath:indexPath];
    
    PCOBeverageModel *beverage = self.beverageStore.beverages[indexPath.row];
    
    // Configure the cell...
    [cell setBeverage:beverage];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PCOBeverageModel *beverage = self.beverageStore.beverages[(int)indexPath.row];
    PCOBeverageDetailTableViewController *nextVC = [[PCOBeverageDetailTableViewController alloc] init];
    nextVC.beverageModel = beverage;
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    PCOBeverageModel *beverage = self.beverageStore.beverages[(int)indexPath.row];
//    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    return kCellHeight;
}

//- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    PCOBeverageModel *beverage = [self.beverageStore.beverages objectAtIndex:indexPath.row];
//    NSString *name = beverage.name;
//    CGSize constraintName = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
//    CGSize nameSize = [name boundingRectWithSize:constraintName options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil].size;
//    CGFloat nameHeight = MAX(nameSize.height, 44.0f);
//    
//    NSString *descShort = beverage.descShort;
//    CGSize constraintDesc = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 2000.0f);
//    CGSize descSize = [descShort boundingRectWithSize:constraintDesc options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil].size;
//    CGFloat descHeight = MAX(descSize.height, 44.0f);
//    
//    return descHeight + nameHeight + (CELL_CONTENT_MARGIN * 2);
//}

@end
