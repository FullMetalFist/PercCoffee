//
//  PCOBeverageName.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/7/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeverageName.h"
#import "UIColor+Coffee.h"

@implementation PCOBeverageName

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.name = [[UILabel alloc] init];
        //self.name.font = [UIFont systemFontOfSize:24.0];
        [self.name setFont:[UIFont fontWithName:@"HelveticaNeue" size:28.0]];
        self.name.textColor = [UIColor colorForGrayDark];
        [self.contentView addSubview:self.name];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame = CGRectMake(boundsX + 20 ,0, 350, 60);
    self.name.frame = frame;
}

@end
