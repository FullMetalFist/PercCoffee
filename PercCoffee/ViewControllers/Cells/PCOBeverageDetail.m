//
//  PCOBeverageDetail.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/7/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeverageDetail.h"
#import "UIColor+Coffee.h"
#import "PCOBeverageModel.h"
#import <UIImageView+AFNetworking.h>

NSString *const kDescLongHorizontal = @"H:|-(10)-[descLong]-(10)-|";
NSString *const kDescLongVertical = @"V:|-(10)-[descLong]-(320)-|";

NSString *const kPictureDetailHorizontal = @"H:|-(10)-[picture]-(10)-|";
NSString *const kPictureDetailVertical = @"V:|-(20)-[picture]-(30)-|";

NSString *const kLastUpdatedHorizontal = @"H:|-(10)-[lastUpdated]-(10)-|";
NSString *const kLastUpdatedVertical = @"V:|-(320)-[lastUpdated]-(10)-|";

@interface PCOBeverageDetail()

@property (nonatomic) UILabel       *descLong;
@property (nonatomic) UILabel       *lastUpdated;
@property (nonatomic) UIImageView   *picture;

@end

@implementation PCOBeverageDetail

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        self.descLong = [[UILabel alloc] init];
        [self.descLong setLineBreakMode:NSLineBreakByWordWrapping];
        [self.descLong setNumberOfLines:0];
        self.descLong.backgroundColor = [UIColor clearColor];
        self.descLong.font = [UIFont systemFontOfSize:12.0];
        [self.descLong setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
        self.descLong.textColor = [UIColor colorForGray];
        self.descLong.text = self.beverage.descLong;
        
        self.lastUpdated = [[UILabel alloc] init];
        self.lastUpdated.backgroundColor = [UIColor clearColor];
        self.lastUpdated.font = [UIFont italicSystemFontOfSize:10.0];
        self.lastUpdated.textColor = [UIColor colorForGray];
        self.lastUpdated.text = self.beverage.lastUpdated;
        
        self.picture = [[UIImageView alloc] init];
        [self.picture setContentMode:UIViewContentModeTopLeft];
        self.picture.clipsToBounds = YES;
        
        [self.contentView addSubview:self.picture];
        [self.contentView addSubview:self.descLong];
        [self.contentView addSubview:self.lastUpdated];
        
        self.descLong.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kDescLongHorizontal options:0 metrics:nil views:@{@"descLong":self.descLong}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kDescLongVertical options:0 metrics:nil views:@{@"descLong":self.descLong}]];
        
        self.picture.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kPictureDetailHorizontal options:0 metrics:nil views:@{@"picture":self.picture}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kPictureDetailVertical options:0 metrics:nil views:@{@"picture":self.picture}]];
        
        self.lastUpdated.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kLastUpdatedHorizontal options:0 metrics:nil views:@{@"lastUpdated":self.lastUpdated}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kLastUpdatedVertical options:0 metrics:nil views:@{@"lastUpdated":self.lastUpdated}]];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
//    if (!self.descLong)
//    {
//        self.descLong = [[UILabel alloc] init];
//        [self.descLong setLineBreakMode:NSLineBreakByWordWrapping];
//        [self.descLong setNumberOfLines:0];
//        self.descLong.backgroundColor = [UIColor clearColor];
//        self.descLong.font = [UIFont systemFontOfSize:15.0];
//        self.descLong.textColor = [UIColor colorForGray];
//        self.descLong.text = self.beverage.descLong;
//        [self.contentView addSubview:self.descLong];
//        self.picture = [[UIImageView alloc] init];
//        [self.picture setContentMode:UIViewContentModeTopLeft];
//        [self.contentView addSubview:self.picture];
//        self.lastUpdated = [[UILabel alloc] init];
//        self.lastUpdated.backgroundColor = [UIColor clearColor];
//        self.lastUpdated.font = [UIFont systemFontOfSize:15.0];
//        [self.lastUpdated setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
//        self.lastUpdated.text = self.beverage.lastUpdated;
//        [self.contentView addSubview:self.lastUpdated];
//        
//    }
}

- (void)setBeverage:(PCOBeverageModel *)beverage
{
    if (_beverage != beverage)
    {
        _beverage = beverage;
        self.descLong.text = beverage.descLong;
        self.lastUpdated.text = beverage.lastUpdated;
        
        if (beverage.imageURLString)
        {
            NSURL *url = [NSURL URLWithString:beverage.imageURLString];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            __weak typeof(self) weakSelf = self;
            
            [self.picture setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                if (![weakSelf.picture.image isEqual:image])
                {
                    [weakSelf.picture setImage:image];
                    
                    if (request && response) //then wasn't cached
                    {
                        CATransition *fade = [CATransition animation];
                        [fade setType:kCATransitionFade];
                        [weakSelf.picture.layer addAnimation:fade forKey:nil];
                    }
                }
                
            } failure:nil];
        }
    }
}

- (void) prepareForReuse
{
    [super prepareForReuse];
    [self.imageView cancelImageRequestOperation];
}

@end
