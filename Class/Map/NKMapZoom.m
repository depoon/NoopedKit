//
//  NKMapZoom.m
//  NoopedKit
//
//  Created by Kenneth Poon on 22/12/14.
//
//

#import "NKMapZoom.h"

@implementation NKMapZoom{
    float minLatitude;
    float maxLatitude;
    float minLongitude;
    float maxLongitude;
    
    float latitude;
    float longitude;
    
}

-(id) init{
    self = [super init];
    [self reset];
    return self;
}

-(void) reset{
    minLatitude = -999;
    maxLatitude = -999;
    minLongitude = -999;
    maxLongitude = -999;
    
    latitude = 0;
    longitude = 0;
    
}

-(void) captureCoordiate: (CLLocationCoordinate2D) coordinate{
    latitude = coordinate.latitude;
    if (minLatitude== -999){
        minLatitude = latitude;
    }
    if (latitude<minLatitude){
        minLatitude = latitude;
    }
    if (maxLatitude== -999){
        maxLatitude = latitude;
    }
    if (latitude>maxLatitude){
        maxLatitude = latitude;
    }
    
    longitude = coordinate.longitude;
    if (minLongitude== -999){
        minLongitude = longitude;
    }
    if (latitude<minLongitude){
        minLongitude = longitude;
    }
    if (maxLongitude== -999){
        maxLongitude = longitude;
    }
    if (latitude>maxLongitude){
        maxLongitude = longitude;
    }
}

-(MKCoordinateRegion) generateZoomMKCoordinateRegion{
    CLLocation *locSouthWest = [[CLLocation alloc] initWithLatitude:minLatitude longitude:minLongitude];
    CLLocation *locNorthEast = [[CLLocation alloc] initWithLatitude:maxLatitude longitude:maxLongitude];
    
    CLLocationDistance meters = [locSouthWest distanceFromLocation:locNorthEast];
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    CLLocationCoordinate2D location;
    span.latitudeDelta = meters / 111319.5;
    span.longitudeDelta = 0.00;
    location.latitude = (minLatitude+maxLatitude)/2.0;
    location.longitude = (minLongitude+maxLongitude)/2.0;
    region.span = span;
    region.center = location;
    
    
    return region;
}

-(void)zoomToFitMapAnnotations:(MKMapView*)aMapView{
    if([aMapView.annotations count] == 0)
        return;
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in aMapView.annotations)
    {
        if (![annotation isKindOfClass:[MKUserLocation class]]){
            topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
            topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
            
            bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
            bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
        }
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.1; // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.1; // Add a little extra space on the sides
    
    region = [aMapView regionThatFits:region];
    [aMapView setRegion:region animated:YES];
    
    
}


@end
