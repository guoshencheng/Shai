//
//  StatusCollectionViewCell.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "StatusCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@implementation StatusCollectionViewCell

- (void)awakeFromNib {
    self.containerView.layer.cornerRadius = 10.0;
    [self.locationImageView setImage:[UIImage imageNamed:@"status_collectionview_cell_location_icon"]];
}

- (void)posterImageViewAddStatusGesture:(UITapGestureRecognizer *)tap {
    [self.posterImageView addGestureRecognizer:tap];
}

- (void)updateWithStatusTool:(StatusTool *)statusTool {
    [self updateWithNickName:statusTool.nickName posterImageUrl:[statusTool.posterImageUrls objectAtIndex:0] description:statusTool.details location:statusTool.location];
}

- (void)updateWithNickName:(NSString *)nickName posterImageUrl:(NSString *)posterImageUrl description:(NSString *)description location:(NSString *)location {
    self.nickNameLabel.text = nickName;
    [self setPosterImageViewWithUrl:posterImageUrl];
    self.descriptionLabel.text = description;
    if (location) {
        [self setLocationLabelWithLocation:location];
    } else {
        self.locationLabel.text = @"";
        self.locationImageView.hidden = YES;
    }
    [self layoutIfNeeded];
}

- (void)setPosterImageViewWithUrl:(NSString *)posterImageUrl {
    if (posterImageUrl) {
        self.posterImageViewRightConstraint.constant = 0;
        [self.posterImageView sd_setImageWithURL:[NSURL URLWithString:posterImageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if ([self.delegate respondsToSelector:@selector(StatusCollectionViewCell:didLoadImage:)]) {
                [self.delegate StatusCollectionViewCell:self didLoadImage:image];
            }
        }];
    } else {
        self.posterImageViewRightConstraint.constant = self.containerView.frame.size.width;
    }
}

- (void)setLocationLabelWithLocation:(NSString *)location {
    if (location && ![location isEqualToString:@""] && ![location isEqualToString:@"ceshi.png"]) {
        NSArray *locationDegreeArray = [location componentsSeparatedByString:@", "];
        if (!locationDegreeArray || locationDegreeArray.count < 2) {
            locationDegreeArray = [location componentsSeparatedByString:@","];
        }
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        CLLocationDegrees latitude = [[locationDegreeArray objectAtIndex:0] doubleValue];
        CLLocationDegrees longitude = [[locationDegreeArray objectAtIndex:1] doubleValue];
        CLLocation *locationObject = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
        [geocoder reverseGeocodeLocation:locationObject completionHandler:^(NSArray *placemarks, NSError *error) {
            if (placemarks.count > 0) {
                CLPlacemark *firstPlacemark=[placemarks firstObject];
                self.locationLabel.text = firstPlacemark.name;
            } else {
                self.locationLabel.text = NSLocalizedString(@"wrong-Location", nil);
            }
        }];
    } else {
        self.locationLabel.text = NSLocalizedString(@"wrong-Location", nil);
    }
}

@end
