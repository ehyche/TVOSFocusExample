//
//  ViewController.m
//  FocusTest2
//
//  Created by Eric Hyche on 11/17/15.
//  Copyright © 2015 Hyche Heirs. All rights reserved.
//

#import "ViewController.h"
#import "TVButton.h"
#import "FocusUtilities.h"

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

@property(nonatomic, strong) UIFocusGuide *focusGuideLeft;
@property(nonatomic, strong) UIFocusGuide *focusGuideRight;

@end

@implementation ViewController

#pragma mark - UIViewController methods

- (void)viewDidLoad {
    [super viewDidLoad];

//    // Create the focus guides and add them to self.view
//    self.focusGuideLeft = [[UIFocusGuide alloc] init];
//    self.focusGuideRight = [[UIFocusGuide alloc] init];
//    [self.view addLayoutGuide:self.focusGuideLeft];
//    [self.view addLayoutGuide:self.focusGuideRight];
//
//    // Set up the left focus guide
//    [self.focusGuideLeft.leftAnchor constraintEqualToAnchor:self.button0.leftAnchor].active = YES;
//    [self.focusGuideLeft.topAnchor constraintEqualToAnchor:self.resetButton.topAnchor].active = YES;
//    [self.focusGuideLeft.bottomAnchor constraintEqualToAnchor:self.resetButton.bottomAnchor].active = YES;
//    [self.focusGuideLeft.rightAnchor constraintEqualToAnchor:self.button0.rightAnchor].active = YES;
//
//    // Set up the right focus guide
//    [self.focusGuideRight.leftAnchor constraintEqualToAnchor:self.button2.leftAnchor].active = YES;
//    [self.focusGuideRight.topAnchor constraintEqualToAnchor:self.resetButton.topAnchor].active = YES;
//    [self.focusGuideRight.bottomAnchor constraintEqualToAnchor:self.resetButton.bottomAnchor].active = YES;
//    [self.focusGuideRight.rightAnchor constraintEqualToAnchor:self.button2.rightAnchor].active = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIFocusEnvironment methods

- (UIView *)preferredFocusedView {
    return self.resetButton;
}

- (BOOL)shouldUpdateFocusInContext:(UIFocusUpdateContext *)context {
    NSLog(@"ViewController shouldUpdateFocusInContext:(%@)", [FocusUtilities NSStringFromUIFocusUpdateContext:context]);
    return YES;
}

- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context
       withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator {
    NSLog(@"ViewController didUpdateFocusInContext:%@ withAnimationCoordinator:", [FocusUtilities NSStringFromUIFocusUpdateContext:context]);

    if (context.nextFocusedView == self.resetButton) {
        // Focus is on the reset button, so we want to tell the focus guides
        // to send us down to their respective buttons:
        // Left Focus Guide -> Button0
        // Right Focus Guide -> Button2
        self.focusGuideLeft.preferredFocusedView = self.button0;
        self.focusGuideRight.preferredFocusedView = self.button2;
    } else {
        // Focus is down among the numbered buttons Button0...Button8,
        // so we want to tell the focus guides to send focus up to
        // the reset button.
        self.focusGuideLeft.preferredFocusedView = self.resetButton;
        self.focusGuideRight.preferredFocusedView = self.resetButton;
    }
}

#pragma mark - Private methods

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
