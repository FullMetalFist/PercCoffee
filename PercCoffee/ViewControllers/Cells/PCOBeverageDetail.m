//
//  PCOBeverageDetail.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/7/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeverageDetail.h"

@implementation PCOBeverageDetail

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.descLong = [[UILabel alloc] init];
        self.picture = [[UIImageView alloc] init];
        self.lastUpdated = [[UILabel alloc] init];
        
        self.lastUpdated.font = [UIFont italicSystemFontOfSize:10.0];
        [self.contentView addSubview:self.descLong];
        [self.contentView addSubview:self.picture];
        [self.contentView addSubview:self.lastUpdated];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame= CGRectMake(boundsX + 10 , 0, 350, 50);
    self.descLong.frame = frame;
    frame= CGRectMake(boundsX + 70 , 45, 350, 25);
    self.picture.frame = frame;
    frame= CGRectMake(boundsX + 70 , 30, 100, 15);
    self.lastUpdated.frame = frame;
}

@end
