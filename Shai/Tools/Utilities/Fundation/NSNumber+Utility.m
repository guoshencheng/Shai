//
//  NSNumber+Utility.m
//  Shai
//
//  Created by guoshencheng on 6/30/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "NSNumber+Utility.h"

@implementation NSNumber (Utility)

- (NSString *)IntegerFommatToString {
    if (self.integerValue < 10) {
        return [NSString stringWithFormat:@"0%d", self.integerValue];
    } else {
        return [NSString stringWithFormat:@"%d", self.integerValue];
    }
}

@end
