//
//  TVButton.m
//  FocusTest2
//
//  Created by Eric Hyche on 11/17/15.
//  Copyright © 2015 Hyche Heirs. All rights reserved.
//

#import "TVButton.h"
#import "FocusUtilities.h"

@implementation TVButton

- (NSString *)description {
    return [NSString stringWithFormat:@"TVButton%@", @(self.tag)];
}

- (void)awakeFromNib {
    self.isFocusPossible = YES;
}

- (BOOL)canBecomeFocused {
    return self.isFocusPossible;
}

- (void)setIsFocusPossible:(BOOL)isFocusPossible {
    if (_isFocusPossible != isFocusPossible) {
        _isFocusPossible = isFocusPossible;
        [self updateBackgroundColor];
    }
}

- (BOOL)shouldUpdateFocusInContext:(UIFocusUpdateContext *)context {
    NSLog(@"%@: shouldUpdateFocusInContext:(%@)", self, [FocusUtilities NSStringFromUIFocusUpdateContext:context]);
    return YES;
}

- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context
       withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator {
    NSLog(@"%@: didUpdateFocusInContext:%@ withAnimationCoordinator:", self, [FocusUtilities NSStringFromUIFocusUpdateContext:context], coordinator);
    [self updateBackgroundColor];
}

- (void)updateBackgroundColor {
    UIColor *bgColor = nil;
    if (self.isFocused) {
        bgColor = [UIColor whiteColor];
    } else {
        if (self.isFocusPossible) {
            bgColor = [UIColor greenColor];
        } else {
            bgColor = [UIColor redColor];
        }
    }
    self.backgroundColor = bgColor;
}

@end
