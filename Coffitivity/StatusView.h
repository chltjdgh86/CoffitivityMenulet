//
//  StatusView.h
//  Coffitivity
//
//  Created by SUNG HO CHOI on 6/12/13.
//  Copyright (c) 2013 Sung Ho Choi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusView : NSControl
@property (retain) NSImage *image;
@property (retain) NSImage *alternateImage;
@property (assign) id target;
@property (assign) SEL action, rightAction;
@property (assign) BOOL clicked;


- (void)setHighlightState:(BOOL)state;

@end
