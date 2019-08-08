//
//  DropitBehavior.h
//  iOS-objC
//
//  Created by ivica petrsoric on 08/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end
