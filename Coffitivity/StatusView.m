//
//  StatusView.m
//  Coffitivity
//
//  Created by SUNG HO CHOI on 6/12/13.
//  Copyright (c) 2013 Sung Ho Choi. All rights reserved.
//

#import "StatusView.h"

@implementation StatusView

- (void)mouseUp:(NSEvent *)event {
    if([event modifierFlags] & NSControlKeyMask) {
        [NSApp sendAction:self.rightAction to:self.target from:self];
    } else {
        [NSApp sendAction:self.action to:self.target from:self];
    }
}
//doesn't work
- (void)rightMouseUp:(NSEvent *)event {
    [NSApp sendAction:self.rightAction to:self.target from:self];
}
- (void)drawRect:(NSRect)rect {
    [self.image drawInRect:self.bounds fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1];
}
@end
