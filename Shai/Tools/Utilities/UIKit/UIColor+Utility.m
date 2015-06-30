//
//  UIColor+Utility.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/23/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "UIColor+Utility.h"

@implementation UIColor (Utility)

//example
+ (instancetype)darkGreyLabelColor {
    return [UIColor colorWithIntRed:50 green:50 blue:50];
}

+ (instancetype)colorWithIntRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha {
    return [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:(alpha / 255.0)];
}

+ (instancetype)colorWithIntRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [UIColor colorWithIntRed:red green:green blue:blue alpha:255];
}

@end
