//
//  TimeView.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "TimeView.h"
#import "NSNumber+Utility.h"

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
    NSString *month = [@([dd month]) IntegerFommatToString];
    NSString *day = [@([dd day]) IntegerFommatToString];
    NSString *hour = [@([dd hour]) IntegerFommatToString];
    NSString *minute = [@([dd minute]) IntegerFommatToString];
    self.monthLabel.text = [NSString stringWithFormat:@"%@%@", month, @"月"];
    self.dayLabel.text = [NSString stringWithFormat:@"%@%@", day, @"日"];
    self.timeLabel.text = [NSString stringWithFormat:@"%@:%@", hour, minute];
    [self layoutIfNeeded];
}

@end
