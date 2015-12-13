//
//  FocusUtilities.h
//  FocusTest2
//
//  Created by Eric Hyche on 12/13/15.
//  Copyright © 2015 Hyche Heirs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FocusUtilities : NSObject

+ (NSString *)NSStringFromUIFocusHeading:(UIFocusHeading)heading;

+ (NSString *)NSStringFromUIFocusUpdateContext:(UIFocusUpdateContext *)context;

@end
