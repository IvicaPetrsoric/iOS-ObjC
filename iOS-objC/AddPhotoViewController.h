//
//  AddPhotoViewController.h
//  iOS-objC
//
//  Created by ivica petrsoric on 12/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddPhotoViewController : UIViewController
// in
@property (nonatomic, strong) NSString *photographer;

// out
@property (nonatomic, readonly) NSString *photo;

@end

