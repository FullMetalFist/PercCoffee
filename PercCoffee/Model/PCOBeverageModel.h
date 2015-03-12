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
@property (nonatomic, copy) NSString *lastUpdated;
@property (nonatomic, copy) NSString *imageURLString;

- (instancetype) initWithBeverage:(NSString *)name
                       beverageID:(NSString *)beverageID
                        descShort:(NSString *)descShort
                         descLong:(NSString *)descLong
                      lastUpdated:(NSString *)lastUpdated
                   imageURLString:(NSString *)imageURLString;

@end
