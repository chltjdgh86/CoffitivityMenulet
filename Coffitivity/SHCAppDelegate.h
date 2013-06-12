//
//  SHCAppDelegate.h
//  Coffitivity
//
//  Created by SUNG HO CHOI on 6/12/13.
//  Copyright (c) 2013 Sung Ho Choi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

@interface SHCAppDelegate : NSObject <NSApplicationDelegate>
{
    NSStatusItem* statusItem;
    NSMenu *statusMenu;
    NSMenuItem *menuItem;
    __weak NSSlider *_slider;
}

@property AVAudioPlayer* audioPlayer;
@property (weak) IBOutlet NSSlider *slider;
- (void) volumeChanged;
@end
