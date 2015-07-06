//
//  CGSizeUtility.m
//  Vibin
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 Vibin, Ltd. All rights reserved.
//

#import "CGSizeUtility.h"

@implementation CGSizeUtility

+ (float)scaleOfsize:(CGSize)scaleSize toAspectFillSize:(CGSize)size {
  if ((scaleSize.width / scaleSize.height)  > (size.width / size.height)) {
    return size.height / scaleSize.height;
  } else {
    return size.width / scaleSize.width;
  }
}

+ (float)scaleOfSize:(CGSize)scaleSize toAspectFitSize:(CGSize)size {
  if ((scaleSize.width / scaleSize.height)  > (size.width / size.height)) {
    return size.width / scaleSize.width;
  } else {
    return size.height / scaleSize.height;
  }
}

@end
