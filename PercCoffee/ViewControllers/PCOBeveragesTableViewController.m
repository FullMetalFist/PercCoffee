//
//  PCOBeveragesTableViewController.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeveragesTableViewController.h"
#import "PCOBeverageStore.h"
#import "PCOBeverageModel.h"

NSString *const CoffeeIdentifier = @"CoffeeIdentifier";

@interface PCOBeveragesTableViewController ()

@property (nonatomic) NSArray *beverageList;

@end

@implementation PCOBeveragesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CoffeeIdentifier];
    
    PCOBeverageStore *beverageStore = [[PCOBeverageStore alloc] init];
    [beverageStore loadBeverages];
    self.beverageList = beverageStore.beverages;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.beverageList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CoffeeIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PCOBeverageModel *beverage = self.beverageList[indexPath.row];
    cell.textLabel.text = beverage.name;
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
