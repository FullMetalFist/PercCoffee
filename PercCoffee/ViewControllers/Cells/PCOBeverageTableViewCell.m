//
//  PCOBeverageTableViewCell.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/5/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeverageTableViewCell.h"
#import "UIColor+Coffee.h"
#import <UIImageView+AFNetworking.h>

//NSString *const kNameLabelHorizontal = @"H:|-10-[name]-10-|";
//NSString *const kNameLabelVertical = @"V:|-10-[name]";
//
//NSString *const kDescShortHorizontal = @"H:|-10-[descShort]-10-|";
//NSString *const kDescShortVertical = @"V:[descShort]";
//
//NSString *const kPictureHorizontal = @"H:|-10-[picture]-10-|";
//NSString *const kPictureVertical = @"V:[picture]-10-|";

@interface PCOBeverageTableViewCell()

@property (nonatomic) UIImageView   *picture;

@end

@implementation PCOBeverageTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        self.name = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.name setLineBreakMode:NSLineBreakByWordWrapping];
        [self.name setNumberOfLines:0];
        self.name.font = [UIFont systemFontOfSize:15.0];
        self.name.textColor = [UIColor colorForGrayDark];
        self.descShort = [[UITextView alloc] init];
        self.descShort.font = [UIFont systemFontOfSize:15.0];
        [self.descShort setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
        self.descShort.textColor = [UIColor colorForGray];
        self.descShort.userInteractionEnabled = NO;
        
        
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.descShort];
        
        if (self.imageURL) {
            self.picture = [[UIImageView alloc] init];
            [self.contentView addSubview:self.picture];
            [self.picture setImageWithURL:self.imageURL];
        }
        
        
//        self.name.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kNameLabelHorizontal options:0 metrics:nil views:@{@"name":self.name}]];
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kNameLabelVertical options:0 metrics:nil views:@{@"name":self.name}]];
//        
//        self.descShort.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kDescShortHorizontal options:0 metrics:nil views:@{@"descShort":self.descShort}]];
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kDescShortVertical options:0 metrics:nil views:@{@"descShort":self.descShort}]];
//        
//        self.picture.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kPictureHorizontal options:0 metrics:nil views:@{@"picture":self.picture}]];
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kPictureVertical options:0 metrics:nil views:@{@"picture":self.picture}]];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
//    [self.contentView setNeedsLayout];
//    [self.contentView layoutIfNeeded];
//    self.name.preferredMaxLayoutWidth = CGRectGetWidth(self.name.frame);
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    frame = CGRectMake(boundsX + 15 , 0, 350, 30);
    self.name.frame = frame;
    frame = CGRectMake(boundsX + 10 , 30, 350, 50);
    self.descShort.frame = frame;
    frame = CGRectMake(boundsX + 10 , 60, 320, 480);
    self.picture.frame = frame;
}

@end
