//
//  PCOBeverageStore.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeverageStore.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "PCOBeverageModel.h"
#import "PCOConstants.h"

#import "NSString+isNumeric.h"

@interface PCOBeverageStore ()

// reactive cocoa could fit here.. save the system from loading a additional arrays
@property (nonatomic, readwrite) NSArray *beverages;
@property (nonatomic)            NSString *innerString;
@property (nonatomic)            PCOBeverageModel *beverageModel;
@property (nonatomic)            NSMutableArray *createBeverages;

@end

@implementation PCOBeverageStore

- (void) loadBeverages
{
    self.createBeverages = [NSMutableArray array];
    [self apiCall];
    self.beverages = [NSArray arrayWithArray:self.createBeverages];
}

- (void) loadDetailsForBeverage:(NSDictionary *)beverage
{
    for (beverage in self.beverages) {
        // numbered id breaks app
        // if it is a number, skip
        
        if ([beverage[@"id"] isNumeric]) {
            NSLog(@"String has only numbers");
            continue;
        }
        else {
            // get the general information
            self.beverageModel = [[PCOBeverageModel alloc]
                                  initWithBeverage:beverage[@"name"]
                                  beverageID:beverage[@"id"]
                                  descShort:beverage[@"desc"]
                                  descLong:nil
                                  lastUpdated:nil
                                  imageURL:beverage[@"image_url"]];
            
            // pull the details
            [self apiInnerCallWithBeverage:self.beverageModel];
            
            // store in array
            [self.createBeverages addObject:self.beverageModel];
        }
    }
    NSLog(@"create Bev %@\nOuter Complete", self.createBeverages);
}

#pragma mark -- api call

- (void)apiCall
{
    NSString *coffeeURLString = [NSString stringWithFormat:@"https://coffeeapi.percolate.com/api/coffee/?api_key=%@", PERCOLATE_API_KEY];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:coffeeURLString parameters:nil success:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {
        //NSLog(@"%@\nDone", responseObject);
        self.beverages = responseObject;
        //
        NSDictionary *drink = [NSDictionary dictionary];
        [self loadDetailsForBeverage:drink];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void) apiInnerCallWithBeverage:(PCOBeverageModel *)beverage
{
    for (beverage in self.createBeverages) {
        NSString *coffeeURLInnerString = [NSString stringWithFormat:@"https://coffeeapi.percolate.com/api/coffee/%@/?api_key=%@", beverage.beverageID, PERCOLATE_API_KEY];
        AFHTTPRequestOperationManager *insideManager = [AFHTTPRequestOperationManager manager];
        [insideManager GET:coffeeURLInnerString parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
            //
            NSLog(@"%@", responseObject);
            beverage.descLong = responseObject[@"desc"];
            beverage.lastUpdated = responseObject[@"last_updated_at"];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@", error.localizedDescription);
        }];
    }
}

@end
