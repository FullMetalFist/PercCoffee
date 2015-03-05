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

@interface PCOBeverageStore ()

@property (nonatomic, readwrite) NSArray *beverages;

@end

@implementation PCOBeverageStore

- (void) loadBeverages
{
    //
}

- (void) loadDetailsForBeverage:(PCOBeverageModel *)beverage
{
    //
}

#pragma mark -- api call

- (void)apiCall{
    NSString *coffeeURLString = [NSString stringWithFormat:@"https://coffeeapi.percolate.com/api/coffee/?api_key=%@", PERCOLATE_API_KEY];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:coffeeURLString parameters:nil success:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {
        NSLog(@"%@", responseObject);
        self.beverages = responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

@end
