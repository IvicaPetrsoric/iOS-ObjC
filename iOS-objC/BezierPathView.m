//
//  BezierPathView.m
//  iOS-objC
//
//  Created by ivica petrsoric on 08/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "BezierPathView.h"

@interface BezierPathView()

@end

@implementation BezierPathView

- (void)setPath:(UIBezierPath *)path {
    _path = path;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}

@end
