//
//  DropitBehavior.m
//  iOS-objC
//
//  Created by ivica petrsoric on 08/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "DropitBehavior.h"

@interface DropitBehavior()
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *colider;
@property (strong, nonatomic) UIDynamicItemBehavior *animationOptions;
@end

@implementation DropitBehavior

- (UIGravityBehavior *)gravity{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 1.0;
    }
    return _gravity;
}

- (UICollisionBehavior *)colider {
    if (!_colider) {
        _colider = [[UICollisionBehavior alloc] init];
        _colider.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _colider;
}

- (UIDynamicItemBehavior *)animationOptions {
    if (!_animationOptions) {
        _animationOptions = [[UIDynamicItemBehavior alloc] init];
        _animationOptions.allowsRotation = NO;
    }
    return _animationOptions;
}

- (void)addItem:(id<UIDynamicItem>)item {
    [self.gravity addItem:item];
    [self.colider addItem:item];
    [self.animationOptions addItem:item];
}

- (void)removeItem:(id<UIDynamicItem>)item {
    [self.gravity removeItem:item];
    [self.colider removeItem:item];
    [self.animationOptions removeItem:item];
}

- (instancetype)init {
    self = [super init];
    
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.colider];
    [self addChildBehavior:self.animationOptions];
    
    return self;
}

@end
