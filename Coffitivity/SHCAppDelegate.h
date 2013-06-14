//
//  SHCAppDelegate.h
//  Coffitivity
//
//  Created by SUNG HO CHOI on 6/12/13.
//  Copyright (c) 2013 Sung Ho Choi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>
#import "StatusView.h"

@interface SHCAppDelegate : NSObject <NSApplicationDelegate>
{
    NSMenu *statusMenu;
    NSMenuItem *menuItem;
    NSStatusItem *statusItem;
    __weak NSSlider *_slider;
}
@property (weak) IBOutlet NSMenu *rightClickMenu;
@property (weak) IBOutlet NSMenuItem *rightClickMenuItem;
//@property (weak) NSStatusItem *statusItem;
@property AVAudioPlayer* audioPlayer;
@property (weak) IBOutlet NSSlider *slider;
@property (strong) StatusView *statusView;

@end
