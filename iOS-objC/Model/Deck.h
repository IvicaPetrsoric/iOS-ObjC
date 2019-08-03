//
//  Deck.h
//  iOS-objC
//
//  Created by ivica petrsoric on 02/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard: (Card *)card atTop: (BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
