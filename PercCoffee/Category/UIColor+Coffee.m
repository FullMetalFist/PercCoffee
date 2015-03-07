//
//  UIColor+Coffee.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/6/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "UIColor+Coffee.h"

@implementation UIColor (Coffee)

+ (UIColor *) colorForOrange
{
    // F16421 Orange Hex
    return [UIColor colorWithRed:241.0 / 255.0 green:100.0 / 255.0 blue:33.0 / 255.0 alpha:1.0];
}

+ (UIColor *) colorForGray
{
    // AAAAAA Gray
    return [UIColor colorWithRed:170.0 / 255.0 green:170.0 / 255.0 blue:170.0 / 255.0 alpha:1.0];
}

+ (UIColor *) colorForGrayDark
{
    // 666666 Grey-Dark
    return [UIColor colorWithRed:102.0 / 255.0 green:102.0 / 255.0 blue:102.0 / 255.0 alpha:1.0];
}

@end
