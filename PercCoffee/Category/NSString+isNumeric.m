//
//  NSString+isNumeric.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/6/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "NSString+isNumeric.h"

@implementation NSString (isNumeric)

-(BOOL) isNumeric
{
    // TODO: for some reason this method constantly throws an exception
    NSCharacterSet *numberSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet *otherSet = [numberSet invertedSet];
    NSString *numbersOnlyString = [[self componentsSeparatedByCharactersInSet:otherSet] componentsJoinedByString:@""];
    if ([numbersOnlyString isEqualToString:self]) {
        return YES;
    }
    return NO;
}

@end
