//
//  NKMapZoom.h
//  NoopedKit
//
//  Created by Kenneth Poon on 22/12/14.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface NKMapZoom : NSObject

-(void) reset;
-(void) captureCoordiate: (CLLocationCoordinate2D) coordinate;
-(MKCoordinateRegion) generateZoomMKCoordinateRegion;

-(void)zoomToFitMapAnnotations:(MKMapView*)aMapView;

@end

