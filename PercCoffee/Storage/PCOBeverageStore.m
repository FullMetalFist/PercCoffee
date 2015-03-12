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
@property (nonatomic)            NSString *innerString;
@property (nonatomic)            NSMutableArray *createBeverages;

@end

@implementation PCOBeverageStore

+ (instancetype) sharedBeverageStore
{
    static PCOBeverageStore *sharedBeverageStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedBeverageStore = [[PCOBeverageStore alloc] init];
    });
    return sharedBeverageStore;
}

- (instancetype) init
{
    if (self = [super init]) {
        self.createBeverages = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) loadBeveragesWithCompletion:(void(^)(void))completion;
{
    NSString *coffeeURLString = [NSString stringWithFormat:@"https://coffeeapi.percolate.com/api/coffee/?api_key=%@", PERCOLATE_API_KEY];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:coffeeURLString parameters:nil success:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {
        NSArray *pulledBeverages = [NSArray arrayWithArray:responseObject];
        
        NSLog(@"%@\nDone", responseObject);
        for (NSDictionary *drink in pulledBeverages) {
            
            if ([drink[@"id"] intValue]) {
                continue;
            }
            
            if ([drink[@"image_url"] length] > 0) {
                
                PCOBeverageModel *beverageMod = [[PCOBeverageModel alloc] initWithBeverage:drink[@"name"]
                                                                                beverageID:drink[@"id"]
                                                                                 descShort:drink[@"desc"]
                                                                                  descLong:nil
                                                                               lastUpdated:nil
                                                                                  imageURLString:drink[@"image_url"]];
                [self.createBeverages addObject:beverageMod];
                
            }
            else {
                
                PCOBeverageModel *beverageMod = [[PCOBeverageModel alloc] initWithBeverage:drink[@"name"]
                                                                                beverageID:drink[@"id"]
                                                                                 descShort:drink[@"desc"]
                                                                                  descLong:nil
                                                                               lastUpdated:nil
                                                                                  imageURLString:nil];
                [self.createBeverages addObject:beverageMod];
            }
            
        }
        completion();
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@", error.localizedDescription);
        
    }];

}

#pragma mark -- api call

- (void) loadBeverageDetail:(PCOBeverageModel *)beverage withCompletion:(void(^)(void))completion
{
    NSString *coffeeURLInnerString = [NSString stringWithFormat:@"https://coffeeapi.percolate.com/api/coffee/%@/?api_key=%@", beverage.beverageID, PERCOLATE_API_KEY];
    AFHTTPRequestOperationManager *insideManager = [AFHTTPRequestOperationManager manager];
    [insideManager GET:coffeeURLInnerString parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        beverage.descLong = responseObject[@"desc"];
        beverage.lastUpdated = responseObject[@"last_updated_at"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void) loadAllBeverageDetails
{
    // iterate through array
    for (PCOBeverageModel *drink in self.createBeverages) {
        [self loadBeverageDetail:drink withCompletion:^{
            NSLog(@"%@ drink loaded", drink.name);
        }];
    }
}

- (void) reset
{
    NSString *resetURLString = [NSString stringWithFormat:@"https://coffeeapi.percolate.com/reset/?api_key=%@", PERCOLATE_API_KEY];
    AFHTTPRequestOperationManager *resetManager = [AFHTTPRequestOperationManager manager];
    [resetManager GET:resetURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"data reset");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (NSArray *) beverages{
    return [self.createBeverages copy];
}

- (NSMutableArray *)clearArray {
    return [NSMutableArray new];
}

@end
