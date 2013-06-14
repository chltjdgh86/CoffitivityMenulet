//
//  StatusView.m
//  Coffitivity
//
//  Created by SUNG HO CHOI on 6/12/13.
//  Copyright (c) 2013 Sung Ho Choi. All rights reserved.
//

#import "StatusView.h"

@implementation StatusView

//- (void)mouseUp:(NSEvent *)event {
//    if([event modifierFlags] & NSControlKeyMask) {
//        [NSApp sendAction:self.rightAction to:self.target from:self];
//    } else {
//        [NSApp sendAction:self.action to:self.target from:self];
//    }
//}

//doesn't work because it's not implemented in delegate
//- (void)rightMouseUp:(NSEvent *)event {
//    [NSApp sendAction:self.rightAction to:self.target from:self];
//}


- (void)drawRect:(NSRect)rect{
    if(self.clicked){
        [[NSColor selectedMenuItemColor] set];
        NSRectFill(rect);
        if(self.alternateImage){
            [self drawImage:self.alternateImage centeredInRect:rect];
        }else if(self.image){
            [self drawImage:self.image centeredInRect:rect];
        }
    }else if(self.image){
        [self drawImage:self.image centeredInRect:rect];
    }
}

- (void)drawImage:(NSImage *)aImage centeredInRect:(NSRect)aRect{
    NSRect imageRect = NSMakeRect((CGFloat)round(aRect.size.width*0.5f-aImage.size.width*0.5f),
                                  (CGFloat)round(aRect.size.height*0.5f-aImage.size.height*0.5f),
                                  aImage.size.width,
                                  aImage.size.height);
    [aImage drawInRect:imageRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0f];
}

- (void)setHighlightState:(BOOL)state;
{
    if(self.clicked != state){
        self.clicked = state;
        [self setNeedsDisplay:YES];
    }
}

- (void)mouseDown:(NSEvent *)theEvent{
    NSLog(@"mouse down left");
    [super mouseDown:theEvent];
    [self setHighlightState:!self.clicked];
    if ([theEvent modifierFlags] & NSCommandKeyMask){
        [self.target performSelectorOnMainThread:self.rightAction withObject:nil waitUntilDone:NO];
    }else{
    [self.target performSelectorOnMainThread:self.action withObject:nil waitUntilDone:NO];
    }
}

- (void)rightMouseDown:(NSEvent *)theEvent{
    NSLog(@"mouse down right");
    [super rightMouseDown:theEvent];
    [self setHighlightState:!self.clicked];
    [self.target performSelectorOnMainThread:self.rightAction withObject:nil waitUntilDone:NO];
}

@end
