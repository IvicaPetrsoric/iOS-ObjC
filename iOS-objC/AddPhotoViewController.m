//
//  AddPhotoViewController.m
//  iOS-objC
//
//  Created by ivica petrsoric on 12/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "AddPhotoViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>   // kUTTypeImage


@interface AddPhotoViewController () <UITextFieldDelegate, UIAlertViewDelegate, CLLocationManagerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *subtitleTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;
@property (strong, nonatomic) NSURL *imageURL;
@property (strong, nonatomic) NSURL *thumbnailURL;
@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic, readwrite) NSString *photo;
@property (nonatomic) NSInteger locationErrorCode;
@end

@implementation AddPhotoViewController

+ (BOOL)canAddPhoto
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        if ([availableMediaTypes containsObject:(NSString *)kUTTypeImage]) {
            if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted) {
                return YES;
            }
        }
    }
    return NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![[self class] canAddPhoto]) {
        [self fatalAlert:@"Sorry no camera"];
    } else {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.locationManager stopUpdatingLocation];
}

#pragma mark: textField deelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (NSURL *)uniqueDocumentURL
{
    NSArray *documentDirectories = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSString *unique = [NSString stringWithFormat:@"%.0f", floor([NSDate timeIntervalSinceReferenceDate])];
    return [[documentDirectories firstObject] URLByAppendingPathComponent:unique];
}

- (NSURL *)imageURL
{
    if (!_imageURL && self.image) {
        NSURL *url = [self uniqueDocumentURL];
        if (url) {
            NSData *imageData = UIImageJPEGRepresentation(self.image, 1.0);
            if ([imageData writeToURL:url atomically:YES]) {
                _imageURL = url;
            }
        }
    }
    return _imageURL;
}

- (NSURL *)thumbnailURL
{
    NSURL *url = [self.imageURL URLByAppendingPathExtension:@"thumbnail"];
    if (![_thumbnailURL isEqual:url]) {
        _thumbnailURL = nil;
        if (url) {
//            UIImage *thumbnail = [self.image imageByScalingToSize:CGSizeMake(75, 75)];
//            NSData *imageData = UIImageJPEGRepresentation(thumbnail, 0.5);
//            if ([imageData writeToURL:url atomically:YES]) {
//                _thumbnailURL = url;
//            }
        }
    }
    return _thumbnailURL;
}
- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
    
    // when image is changed, we must delete files we've created (if any)
    [[NSFileManager defaultManager] removeItemAtURL:_imageURL error:NULL];
    [[NSFileManager defaultManager] removeItemAtURL:_thumbnailURL error:NULL];
    self.imageURL = nil;
    self.thumbnailURL = nil;
}

- (UIImage *)image {
    return self.imageView.image;
}

- (IBAction)cancel {
    self.image = nil;
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)takePhoto:(UIButton *)sender {
    UIImagePickerController *uiipc = [[UIImagePickerController alloc] init];
    uiipc.delegate = self;
    uiipc.mediaTypes = @[(NSString *)kUTTypeImage];
    uiipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    uiipc.allowsEditing = YES;
    [self presentViewController:uiipc animated:true completion: NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (!image) {
        image = info[UIImagePickerControllerOriginalImage];
    }
    
    self.image = image;
    [self dismissViewControllerAnimated:true completion:NULL];
}

#define UNWIND_SEGUE_IDENTIFIER @"Do Add Photo"
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:UNWIND_SEGUE_IDENTIFIER]) {
        NSString *string = @"TOSTERRR";
        self.photo = string;
        
        self.imageURL = nil;
        self.thumbnailURL = nil;
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:UNWIND_SEGUE_IDENTIFIER]) {
        if (!self.image) {
            [self alert: @"No photo taken"];
            return NO;
        } else if (![self.titleTextField.text length]) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
    }
}

- (void)alert:(NSString *)message {
    [[[UIAlertView alloc] initWithTitle:@"Add Photo"
                                message:message
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}

- (void)fatalAlert:(NSString *)msg
{
    [[[UIAlertView alloc] initWithTitle:@"Add Photo"
                                message:msg
                               delegate:self // we're going to cancel when dismissed
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self cancel];
}

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager = locationManager;
    }
    return _locationManager;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.location = [locations lastObject];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    self.locationErrorCode = error.code;
}

@end
