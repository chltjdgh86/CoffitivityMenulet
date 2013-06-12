//
//  SHCAppDelegate.m
//  Coffitivity
//
//  Created by SUNG HO CHOI on 6/12/13.
//  Copyright (c) 2013 Sung Ho Choi. All rights reserved.
//

#import "SHCAppDelegate.h"

@implementation SHCAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}
- (void) awakeFromNib{
    statusMenu = [[NSMenu alloc] init];
    menuItem = [[NSMenuItem alloc] init];
    [statusMenu addItem:menuItem];
    [menuItem setView:_slider];
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setMenu:statusMenu];
    NSString* imagePath = [[NSBundle mainBundle] pathForResource:@"logo-signup_small" ofType:@"png"];
    NSImage* logo = [[NSImage alloc] initWithContentsOfFile:imagePath];
    [statusItem setImage:logo];
    [statusItem setHighlightMode:YES];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"cleanupcut" ofType:@"mp3"];
    NSData *file = [[NSData alloc] initWithContentsOfFile:filePath];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:file error:nil];
    [self.audioPlayer prepareToPlay];
    self.audioPlayer.volume = 0.2;
    [self.audioPlayer play];
}

- (IBAction)volumeChanged:(NSSlider*)sender
{
    self.audioPlayer.volume = sender.doubleValue;
}
@end
