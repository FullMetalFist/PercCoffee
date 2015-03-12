//
//  PCOBeverageModel.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeverageModel.h"

@implementation PCOBeverageModel

- (instancetype) initWithBeverage:(NSString *)name
                       beverageID:(NSString *)beverageID
                        descShort:(NSString *)descShort
                         descLong:(NSString *)descLong
                      lastUpdated:(NSString *)lastUpdated
                         imageURLString:(NSString *)imageURLString
{
    self = [super init];
    if (self) {
        _name = name;
        _beverageID = beverageID;
        _descShort = descShort;
        _descLong = descLong;
        _lastUpdated = lastUpdated;
        _imageURLString = imageURLString;
    }
    return self;
}

@end
