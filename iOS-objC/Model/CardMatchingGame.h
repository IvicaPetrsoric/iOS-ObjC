//
//  CardMatchingGame.h
//  iOS-objC
//
//  Created by ivica petrsoric on 05/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWtihCardCount:(NSUInteger)count usingDeck: (Deck *)deck;

- (void)schooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
