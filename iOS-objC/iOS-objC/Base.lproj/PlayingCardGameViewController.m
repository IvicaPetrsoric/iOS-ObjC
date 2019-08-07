//
//  PlayingCardGameViewController.m
//  iOS-objC
//
//  Created by ivica petrsoric on 07/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createdDeck {
    return [[PlayingCardDeck alloc] init];
}

@end
