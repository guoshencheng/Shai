//
//  DemoOneViewController.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/23/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "DemoOneViewController.h"
#import "UINavigationController+CustomNavigationController.h"
#import "DemoTwoViewController.h"

@implementation DemoOneViewController {
    BMKMapView* _mapView;
    BMKLocationService *_locService;
}

+ (instancetype)create {
    return [[DemoOneViewController alloc] initWithNibName:@"DemoOneViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    //    label.text = NSLocalizedString(@"author", nil);
    //    [self.view addSubview:label];
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    self.view = _mapView;
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    
    [[ApiService serviceWithDelegate:self] sendJSONRequest:[ApiRequest requestForTestServer]];
    [self toast:@"completecompletecompletecompletecompletecompletecompletecomplete" complete:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
}

- (void)service:(ApiService *)service didFinishRequest:(ApiRequest *)request withResponse:(ApiResponse *)response {
    NSLog(@"%@", response);
}

- (IBAction)didClickPushViewControllerButton:(id)sender {
    [self.navigationController cubeRightPushViewController:[DemoTwoViewController create]];
}

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    //NSLog(@"heading is %@",userLocation.heading);
    [_mapView updateLocationData:userLocation];
    
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    BMKCoordinateRegion region;
    //将定位的点居中显示
    region.center.latitude = userLocation.location.coordinate.latitude;
    region.center.longitude = userLocation.location.coordinate.longitude;
    region.span.latitudeDelta = 0.1;//经度范围（设置为0.1表示显示范围为0.2的纬度范围）
    region.span.longitudeDelta = 0.1;//纬度范围
    [_mapView setRegion:region animated:YES];
    [_mapView updateLocationData:userLocation];
}

@end
