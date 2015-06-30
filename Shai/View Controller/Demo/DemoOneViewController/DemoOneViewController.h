//
//  DemoOneViewController.h
//  ArchitectureProject
//
//  Created by guoshencheng on 6/23/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"
#import "ApiService.h"
#import <BaiduMapAPI/BMapKit.h>
#import <BaiduMapAPI/BMKLocationService.h>

@interface DemoOneViewController : BaseViewController <ApiServiceDelegate, BMKMapViewDelegate, BMKLocationServiceDelegate>



@end
