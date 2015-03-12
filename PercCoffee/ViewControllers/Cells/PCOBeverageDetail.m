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

@interface PCOBeverageDetail()

@property (nonatomic) UILabel       *descLong;
@property (nonatomic) UILabel       *lastUpdated;
@property (nonatomic) UIImageView   *picture;

@end

@implementation PCOBeverageDetail

@synthesize picture = _picture;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.descLong = [[UILabel alloc] init];
        self.picture = [[UIImageView alloc] init];
        self.lastUpdated = [[UILabel alloc] init];
        self.descLong.userInteractionEnabled = NO;
        self.descLong.backgroundColor = [UIColor clearColor];
        self.descLong.font = [UIFont systemFontOfSize:12.0];
        self.descLong.textColor = [UIColor colorForGray];
        self.lastUpdated.backgroundColor = [UIColor clearColor];
        self.lastUpdated.font = [UIFont italicSystemFontOfSize:10.0];
        self.lastUpdated.textColor = [UIColor colorForGray];
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
    frame = CGRectMake(boundsX + 10 , 0, 350, 50);
    self.descLong.frame = frame;
    frame = CGRectMake(boundsX + 10 , 55, 350, 225);
    self.picture.frame = frame;
    frame = CGRectMake(boundsX + 15 , 280, 150, 150);
    self.lastUpdated.frame = frame;
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

@end
