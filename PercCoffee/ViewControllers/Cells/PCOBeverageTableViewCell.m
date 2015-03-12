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
#import "PCOBeverageModel.h"

//NSString *const kNameLabelHorizontal = @"H:|-10-[name]-10-|";
//NSString *const kNameLabelVertical = @"V:|-10-[name]";
//
//NSString *const kDescShortHorizontal = @"H:|-10-[descShort]-10-|";
//NSString *const kDescShortVertical = @"V:[descShort]";
//
//NSString *const kPictureHorizontal = @"H:|-10-[picture]-10-|";
//NSString *const kPictureVertical = @"V:[picture]-10-|";

@interface PCOBeverageTableViewCell()

@property (nonatomic) UILabel       *name;
@property (nonatomic) UILabel       *descShort;
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
        self.name.backgroundColor = [UIColor clearColor];
        self.name.font = [UIFont systemFontOfSize:15.0];
        self.name.textColor = [UIColor colorForGrayDark];
        self.name.text = self.beverage.name;
        self.descShort = [[UILabel alloc] init];
        self.descShort.backgroundColor = [UIColor clearColor];
        self.descShort.font = [UIFont systemFontOfSize:15.0];
        [self.descShort setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
        self.descShort.textColor = [UIColor colorForGray];
        self.descShort.userInteractionEnabled = NO;
        self.descShort.text = self.beverage.descShort;
        
        
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.descShort];
        
        self.picture = [[UIImageView alloc] init];
        [self.picture setContentMode:UIViewContentModeTopLeft];
        [self.contentView addSubview:self.picture];
        
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

- (void)setBeverage:(PCOBeverageModel *)beverage
{
    if (_beverage != beverage)
    {
        _beverage = beverage;
        self.name.text = beverage.name;
        self.descShort.text = beverage.descShort;
        
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

- (void)prepareForReuse
{
    [super prepareForReuse];
    [self.imageView cancelImageRequestOperation];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    if (!self.name)
    {
        CGSize nameSize = [self.name.text boundingRectWithSize:CGSizeMake(150, 104) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.name.font} context:nil].size;
        self.name.frame = CGRectMake(15, 10, self.contentView.bounds.size.width, nameSize.height);
        [self.contentView addSubview:self.name];
        
        CGSize descSize = [self.descShort.text boundingRectWithSize:CGSizeMake(150, 104) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.descShort.font} context:nil].size;
        self.descShort.frame = CGRectMake(10, nameSize.height + 10, self.contentView.bounds.size.width, descSize.height);
        [self.contentView addSubview:self.descShort];
                
        CGRect contentRect = self.contentView.bounds;
        CGFloat boundsX = contentRect.origin.x;
        CGRect frame;
        
        CGFloat labelSize = (nameSize.height + descSize.height + 20);
        
        
        
        frame = CGRectMake(boundsX + 10 , labelSize, 320, 480);
        self.picture.frame = frame;
    }
}

- (NSArray*)containedViewConstraints
{
    NSDictionary *views = NSDictionaryOfVariableBindings(self);
    
    return [[NSLayoutConstraint constraintsWithVisualFormat: @"V:|-0-[self]-0-|"
                                                    options:0
                                                    metrics:nil
                                                      views:views]
            arrayByAddingObjectsFromArray:
            [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-0-[self]-0-|"
                                                    options:0
                                                    metrics:nil
                                                      views:views]];
}

@end
