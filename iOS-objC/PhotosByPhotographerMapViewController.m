//
//  PhotosByPhotographerMapViewController.m
//  iOS-objC
//
//  Created by ivica petrsoric on 12/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "PhotosByPhotographerMapViewController.h"
#import "MapKit/MapKit.h"

@interface PhotosByPhotographerMapViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation PhotosByPhotographerMapViewController

- (void)setMapView:(MKMapView *)mapView {
    _mapView = mapView;
    self.mapView.delegate = self;
}

- (void)updateMapViewAnnotations {
    [self.mapView removeAnnotation:self.mapView.annotations];
//    [self.mapView addAnnotation:self.XX];
//    [self.mapView showAnnotations:self.XXX animated:TRUE];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *resuId = @"PhotosByPhotographerMapViewController";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:resuId];
    
    if (!view) {
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                               reuseIdentifier:resuId];
        view.canShowCallout = YES;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
        view.leftCalloutAccessoryView = imageView;
        UIButton *disclosureButton = [[UIButton alloc] init];
        [disclosureButton setBackgroundImage:[UIImage imageNamed:@"disclosure"] forState:normal];
        [disclosureButton sizeToFit];
        view.rightCalloutAccessoryView = disclosureButton;
    }
    
    view.annotation = annotation;
    return view;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    [self updateLeftCalloutAccessoryViewInAnnotationView:view];
}

- (void)updateLeftCalloutAccessoryViewInAnnotationView:(MKAnnotationView *)annotationView
{
    UIImageView *imageView = nil;
    if ([annotationView.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]) {
        imageView = (UIImageView *)annotationView.leftCalloutAccessoryView;
    }
    if (imageView) {
        //        Photo *photo = nil;
        //        if ([annotationView.annotation isKindOfClass:[Photo class]]) {
        //            photo = (Photo *)annotationView.annotation;
        //        }
        //        if (photo) {
        //#warning Blocking main queue!
        //            imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photo.thumbnailURL]]];
        //        }
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    if (self.imageViewController) {
        [self prepareViewController:self.imageViewController
                           forSegue:nil
                   toShowAnnotation:view.annotation];
    } else {
        [self updateLeftCalloutAccessoryViewInAnnotationView:view];
    }}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[MKAnnotationView class]]) {
        [self prepareViewController:segue.destinationViewController
                           forSegue:segue.identifier
                   toShowAnnotation:((MKAnnotationView *)sender).annotation];
    }
}

- (void)prepareViewController:(id)vc
                     forSegue:(NSString *)segueIdentifier
             toShowAnnotation:(id <MKAnnotation>)annotation
{
    //    Photo *photo = nil;
    //    if ([annotation isKindOfClass:[Photo class]]) {
    //        photo = (Photo *)annotation;
    //    }
    //    if (photo) {
    //        if (![segueIdentifier length] || [segueIdentifier isEqualToString:@"Show Photo"]) {
    //            if ([vc isKindOfClass:[ImageViewController class]]) {
    //                ImageViewController *ivc = (ImageViewController *)vc;
    //                ivc.imageURL = [NSURL URLWithString:photo.imageURL];
    //                ivc.title = photo.title;
    //            }
    //        }
    //    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Toster";
}

@end
