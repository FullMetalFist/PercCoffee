//
//  PCOBeverageStore.h
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCOBeverageModel;

@interface PCOBeverageStore : NSObject

@property (nonatomic, readonly) NSArray *beverages;

- (void) loadBeverages;
- (void) loadDetailsForBeverage:(PCOBeverageModel *)beverage;

@end
