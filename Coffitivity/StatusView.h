//
//  StatusView.h
//  Coffitivity
//
//  Created by SUNG HO CHOI on 6/12/13.
//  Copyright (c) 2013 Sung Ho Choi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusView : NSControl
{
    NSImage *image;
    id target;
    SEL action, rightAction;
}
@property (retain) NSImage *image;
@property (assign) id target;
@property (assign) SEL action, rightAction;
@end
