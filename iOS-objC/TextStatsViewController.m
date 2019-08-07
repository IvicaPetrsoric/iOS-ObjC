//
//  TextStatsViewController.m
//  iOS-objC
//
//  Created by ivica petrsoric on 07/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlineCharactersLabel;
@end

@implementation TextStatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze {
    _textToAnalyze = textToAnalyze;
    
    if (self.view.window) {
        [self updateUI];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI {
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%d colorful characters",
                                          [[self characterWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlineCharactersLabel.text = [NSString stringWithFormat:@"%d outlined characters",
                                         [[self characterWithAttribute:NSStrokeWidthAttributeName] length]];
}


- (NSAttributedString *)characterWithAttribute: (NSString *)attributedName {
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    int index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributedName
                                         atIndex:index
                                  effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.length + range.length;
        } else {
            index++;
        }
    }
    
    return characters;
}



@end
