//
//  TimeView.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "TimeView.h"

@implementation TimeView

+ (instancetype)create {
    TimeView *timeView = [[[NSBundle mainBundle] loadNibNamed:@"TimeView" owner:nil options:nil] lastObject];
    timeView.translatesAutoresizingMaskIntoConstraints = NO;
    return timeView;
}

- (void)updateWithDate:(NSDate *)date {
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dd = [cal components:unitFlags fromDate:date];
    NSInteger month = [dd month];
    NSInteger day = [dd day];
    NSInteger hour = [dd hour];
    NSInteger minute = [dd minute];
    self.monthLabel.text = [NSString stringWithFormat:@"%d%@", month, @"月"];
    self.dayLabel.text = [NSString stringWithFormat:@"%d%@", day, @"日"];
    self.timeLabel.text = [NSString stringWithFormat:@"%d:%d", hour, minute];
    [self layoutIfNeeded];
}

@end
