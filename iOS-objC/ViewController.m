//
//  ViewController.m
//  iOS-objC
//
//  Created by ivica petrsoric on 02/08/2019.
//  Copyright © 2019 ivica petrsoric. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;

@end

@implementation ViewController

int counter;

- (void)viewDidLoad {
    [super viewDidLoad];

    counter = 0;
    self.myLabel.text = [[NSNumber numberWithInt:counter] stringValue];
    
}
- (IBAction)buttonPressed:(UIButton *)sender {
    counter++;
    
    _myLabel.text = [[NSNumber numberWithInt:counter] stringValue];
    
    _mySlider.value = counter;
}

- (IBAction)sliderMoved:(id)sender {
    counter = _mySlider.value;
    
    _myLabel.text = [[NSNumber numberWithInt:counter] stringValue];
}

@end
