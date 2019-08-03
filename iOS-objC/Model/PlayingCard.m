//
//  PlayingCard.m
//  iOS-objC
//
//  Created by ivica petrsoric on 02/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    // @[] make aloc and init array with obj
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
//    return [NSString stringWithFormat:@"%d%@", self.rank, self.suit]; //d = int, @ = obj
}

// if we implement setter and getter we need to do this to!!!
@synthesize suit = _suit;

// class method, for creating things and utilitiys methods
+ (NSArray *)validSuits
{
    return @[@"❤", @"♦", @"♣", @"♠"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3",@"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
    return [[self rankStrings] count] -1;
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
