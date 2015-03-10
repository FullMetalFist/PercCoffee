//
//  PCOBeverageTableViewCell.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeverageTableViewCell.h"

@implementation PCOBeverageTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.name = [[UILabel alloc] init];
        self.name.font = [UIFont systemFontOfSize:15.0];
        self.descShort = [[UILabel alloc] init];
        self.descShort.font = [UIFont systemFontOfSize:15.0];
        self.picture = [[UIImageView alloc] init];
        
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.descShort];
        [self.contentView addSubview:self.picture];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
}

@end
