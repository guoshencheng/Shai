//
//  UITextField+Utility.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/23/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "UITextField+Utility.h"

@implementation UITextField (Utility)

- (CGFloat)textWidth {
    CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName : self.font}];
    return size.width;
}

- (void)shakeWithDelegate:(id)delegate {
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    shake.delegate = delegate;
    [shake setDuration:0.1];
    [shake setRepeatCount:3];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint:CGPointMake(self.center.x - 10,self.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint:CGPointMake(self.center.x + 10, self.center.y)]];
    [self.layer addAnimation:shake forKey:@"position"];
}

@end
