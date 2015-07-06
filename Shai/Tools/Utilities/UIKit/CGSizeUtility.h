//
//  CGSizeUtility.h
//  Vibin
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 Vibin, Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGSizeUtility : NSObject

+ (float)scaleOfSize:(CGSize)scaleSize toAspectFitSize:(CGSize)size;
+ (float)scaleOfsize:(CGSize)scaleSize toAspectFillSize:(CGSize)size;

@end
