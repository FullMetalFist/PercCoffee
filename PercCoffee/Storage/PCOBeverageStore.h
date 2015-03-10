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

+ (instancetype) sharedBeverageStore;
- (NSArray *) beverages;
- (void) loadBeveragesWithCompletion:(void(^)(void))completion;
- (void) loadAllBeverageDetails;

@end
