//
//  PCOBeverageDetail.m
//  PercCoffee
//
//  Created by Michael Vilabrera on 3/7/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PCOBeverageDetail.h"
#import "UIColor+Coffee.h"

@interface PCOBeverageDetail()

@property (nonatomic) UIImage       *image;
@property (nonatomic) UIImageView   *picture;

@end

@implementation PCOBeverageDetail

@synthesize picture = _picture;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.descLong = [[UITextView alloc] init];
        self.picture = [[UIImageView alloc] init];
        self.lastUpdated = [[UILabel alloc] init];
        self.descLong.userInteractionEnabled = NO;
        self.descLong.font = [UIFont systemFontOfSize:12.0];
        self.descLong.textColor = [UIColor colorForGray];
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
//
//- (void) startDownloadingImage
//{
//    NSURLRequest *request = [NSURLRequest requestWithURL:self.imageURL];
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
//    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request
//                                                    completionHandler:^(NSURL *localfile, NSURLResponse *response, NSError *error) {
//                                                        if (!error) {
//                                                            if ([request.URL isEqual:self.imageURL]) {
//                                                                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:localfile]];
//                                                                dispatch_async(dispatch_get_main_queue(), ^{
//                                                                    self.image = image;
//                                                                });
//                                                            }
//                                                        }
//                                                    }];
//    [task resume];
//}
//
////- (void) setPicture:(UIImage *)image
////{
////    self.picture.image = image;
////    [self.picture sizeToFit];
////}
//
//- (void) setImageURL:(NSURL *)imageURL
//{
//    _imageURL = imageURL;
//    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];  // block main queue in NSData
//    [self startDownloadingImage];
//}
//
//- (UIImageView *) picture
//{
//    if (!_picture) {
//        _picture = [[UIImageView alloc] init];
//    }
//    return _picture;
//}
//
//- (UIImage *) image
//{
//    return self.picture.image;
//}
//
//- (void) setImage:(UIImage *)image
//{
//    self.picture.image = image;
//    [self.picture sizeToFit];
//}

@end
