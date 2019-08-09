//
//  ViewController.m
//  iOS-objC
//
//  Created by ivica petrsoric on 02/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
        ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
//        ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/%@.jpg", segue.identifier]];
        NSString *urlString = [NSString stringWithFormat:@"https://i.pinimg.com/474x/a7/e2/64/a7e2647f179ae67397b7bf62d97499d6--krk-wallpapers.jpg"];
        ivc.imageURL = [NSURL URLWithString:urlString];
        ivc.title = segue.identifier;
    }
}


@end
