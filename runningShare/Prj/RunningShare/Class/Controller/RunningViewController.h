//
//  RunningViewController.h
//  RunningShare
//
//  Created by Lys on 14/11/21.
//  Copyright (c) 2014年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface RunningViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    //跑步路线
	MKMapRect _routeRect;
    CLLocation* _currentLocation;
}

//跑步路线
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray* points;
@property (nonatomic, retain) MKPolyline* routeLine;
@property (nonatomic, retain) MKPolylineView* routeLineView;
@property (nonatomic, retain) CLLocationManager* locationManager;

//跑步状态

@end
