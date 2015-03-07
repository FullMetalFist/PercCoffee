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
    NSScanner *sc = [NSScanner scannerWithString: self];
    // We can pass NULL because we don't actually need the value to test
    // for if the string is numeric. This is allowable.
    if ( [sc scanFloat:NULL] )
    {
        // Ensure nothing left in scanner so that "42foo" is not accepted.
        // ("42" would be consumed by scanFloat above leaving "foo".)
        return [sc isAtEnd];
    }
    // Couldn't even scan a float :(
    return NO;
}

@end
