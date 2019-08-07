//
//  ViewController.h
//  iOS-objC
//
//  Created by ivica petrsoric on 02/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//
// abstract class. Must implement methods as described below.


#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController


// protected
// for subclasses
- (Deck *)createdDeck; // abstract

@end

