//
//  PCOBeverageModel.h
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCOBeverageModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *beverageID;
@property (nonatomic, copy) NSString *descShort;
@property (nonatomic, copy) NSString *descLong;
@property (nonatomic)       NSDate   *lastUpdated;
@property (nonatomic, copy) NSURL    *imageURL;

- (instancetype) initWithBeverage:(NSString *)name
                       beverageID:(NSString *)beverageID
                        descShort:(NSString *)descShort
                         descLong:(NSString *)descLong
                      lastUpdated:(NSDate *)lastUpdated
                         imageURL:(NSURL *)imageURL;

@end
