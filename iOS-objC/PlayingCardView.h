
//
//  PlayingCardView.h
//  iOS-objC
//
//  Created by ivica petrsoric on 07/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void)pinch: (UIPinchGestureRecognizer *)gesture;

@end
