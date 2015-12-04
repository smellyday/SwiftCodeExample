//
//  ViewController.m
//  MapboxTest
//
//  Created by zhangpan on 15/12/4.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

#import "ViewController.h"
#import "Mapbox.h"

@interface ViewController ()

@property (nonatomic) MGLMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.styleURL = [MGLStyle lightStyleURL];
    
    // set the map's center coordinate
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(38.894368, -77.036487)
                            zoomLevel:15
                             animated:NO];
    [self.view addSubview:self.mapView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
