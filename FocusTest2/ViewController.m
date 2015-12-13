//
//  ViewController.m
//  FocusTest2
//
//  Created by Eric Hyche on 11/17/15.
//  Copyright © 2015 Hyche Heirs. All rights reserved.
//

#import "ViewController.h"
#import "TVButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet TVButton *resetButton;
@property (weak, nonatomic) IBOutlet TVButton *button0;
@property (weak, nonatomic) IBOutlet TVButton *button1;
@property (weak, nonatomic) IBOutlet TVButton *button2;
@property (weak, nonatomic) IBOutlet TVButton *button3;
@property (weak, nonatomic) IBOutlet TVButton *button4;
@property (weak, nonatomic) IBOutlet TVButton *button5;
@property (weak, nonatomic) IBOutlet TVButton *button6;
@property (weak, nonatomic) IBOutlet TVButton *button7;
@property (weak, nonatomic) IBOutlet TVButton *button8;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context
       withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator {
    NSLog(@"didUpdateFocusInContext:withAnimationCoordinator");
}

- (IBAction)resetAllButtonTapped:(id)sender {
    self.button0.isFocusPossible = YES;
    self.button1.isFocusPossible = YES;
    self.button2.isFocusPossible = YES;
    self.button3.isFocusPossible = YES;
    self.button4.isFocusPossible = YES;
    self.button5.isFocusPossible = YES;
    self.button6.isFocusPossible = YES;
    self.button7.isFocusPossible = YES;
    self.button8.isFocusPossible = YES;
}

- (IBAction)button0Tapped:(id)sender {
    [self toggleButtonPossibleFocus:sender];
}

- (IBAction)button1Tapped:(id)sender {
    [self toggleButtonPossibleFocus:sender];
}

- (IBAction)button2Tapped:(id)sender {
    [self toggleButtonPossibleFocus:sender];
}

- (IBAction)button3Tapped:(id)sender {
    [self toggleButtonPossibleFocus:sender];
}

- (IBAction)button4Tapped:(id)sender {
    [self toggleButtonPossibleFocus:sender];
}

- (IBAction)button5Tapped:(id)sender {
    [self toggleButtonPossibleFocus:sender];
}

- (IBAction)button6Tapped:(id)sender {
    [self toggleButtonPossibleFocus:sender];
}

- (IBAction)button7Tapped:(id)sender {
    [self toggleButtonPossibleFocus:sender];
}

- (IBAction)button8Tapped:(id)sender {
    [self toggleButtonPossibleFocus:sender];
}

- (void)toggleButtonPossibleFocus:(id)sender {
    if ([sender isKindOfClass:[TVButton class]]) {
        TVButton *button = (TVButton *)sender;
        // Toggle whether or not this button can be focusable
        button.isFocusPossible = !button.isFocusPossible;
        // Tell the focus engine we need to update focus
        [super setNeedsFocusUpdate];
    }
}

@end
