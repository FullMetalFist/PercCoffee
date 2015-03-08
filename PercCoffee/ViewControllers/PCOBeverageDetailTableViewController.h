//
//  PCOBeverageDetailTableViewController.h
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCOBeverageDetailTableViewController : UITableViewController

@property (nonatomic) UITableViewCell *nameCell;
@property (nonatomic) UITableViewCell *detailsCell;
@property (nonatomic) UIImageView *picture;
@property (nonatomic) NSDate *lastUpdated;

@end
