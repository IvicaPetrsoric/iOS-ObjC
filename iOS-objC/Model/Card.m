//
//  Card.m
//  iOS-objC
//
//  Created by ivica petrsoric on 02/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "Card.h"

// private implementation
@interface Card()

@end

@implementation Card

// default set/getter in nonatomic is set!
//@synthesize contents = _contents;
//
//- (NSString *)contents {
//    return _contents;
//}
//
//-(void)setContents:(NSString *)contents {
//    _contents = contents;
//}
//- (int)match:(Card *)card
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString: self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
