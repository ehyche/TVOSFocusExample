//
//  FocusUtilities.m
//  FocusTest2
//
//  Created by Eric Hyche on 12/13/15.
//  Copyright © 2015 Hyche Heirs. All rights reserved.
//

#import "FocusUtilities.h"

@implementation FocusUtilities

+ (NSString *)NSStringFromUIFocusHeading:(UIFocusHeading)heading {
    NSMutableArray *tmp = [NSMutableArray array];

    if (heading & UIFocusHeadingUp) {
        [tmp addObject:@"Up"];
    }
    if (heading & UIFocusHeadingDown) {
        [tmp addObject:@"Down"];
    }
    if (heading & UIFocusHeadingLeft) {
        [tmp addObject:@"Left"];
    }
    if (heading & UIFocusHeadingRight) {
        [tmp addObject:@"Right"];
    }
    if (heading & UIFocusHeadingNext) {
        [tmp addObject:@"Next"];
    }
    if (heading & UIFocusHeadingPrevious) {
        [tmp addObject:@"Previous"];
    }

    return [tmp componentsJoinedByString:@","];
}

+ (NSString *)NSStringFromUIFocusUpdateContext:(UIFocusUpdateContext *)context {
    return [NSString stringWithFormat:@"UIFocusUpdateContext[%p] previous=%@ next=%@ heading=%@",
            context, context.previouslyFocusedView, context.nextFocusedView, [FocusUtilities NSStringFromUIFocusHeading:context.focusHeading]];
}


@end
