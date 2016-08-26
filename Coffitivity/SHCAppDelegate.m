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
    statusMenu = [[NSMenu alloc] init];
    menuItem = [[NSMenuItem alloc] init];

//
//    NSString* imagePath = [[NSBundle mainBundle] pathForResource:@"coffitivity" ofType:@"png"];
//    NSImage* logo = [[NSImage alloc] initWithContentsOfFile:imagePath];
//    [statusItem setImage:logo];
//    [statusItem setHighlightMode:YES];
//    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
//    [statusItem setMenu:statusMenu];
    
    self.statusView = [[StatusView alloc] init];
    self.statusView.image = [NSImage imageNamed:@"MenuletIcon"];
    self.statusView.alternateImage = [NSImage imageNamed:@"MenuletIcon"];
    self.statusView.target = self;
    self.statusView.action = @selector(mainAction);
    self.statusView.rightAction = @selector(showMenu);
    
    [self.rightClickMenu setDelegate:self];
    
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    [statusItem setView:self.statusView];
    [statusItem setMenu:statusMenu];
    [statusMenu addItem:menuItem];
    [menuItem setView:self.slider];
    


}

- (void)showMenu{
    // check if we are showing the highlighted state of the custom status item view
    if(self.statusView.clicked){
        // show the right click menu
        [statusItem popUpStatusItemMenu:self.rightClickMenu];
    }
}

- (void)menuDidClose:(NSMenu *)menu{
    [self.statusView setHighlightState:NO];
}

- (void)mainAction {
    NSLog(@"mainaction triggered");
    [statusItem popUpStatusItemMenu:statusMenu];
}

- (void) awakeFromNib
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"cleanupcut" ofType:@"mp3"];
    NSData *file = [[NSData alloc] initWithContentsOfFile:filePath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:file error:nil];
    [self.audioPlayer prepareToPlay];
    self.audioPlayer.volume = self.slider.doubleValue;
    self.audioPlayer.numberOfLoops = -1;
    [self.audioPlayer play];
    }

- (IBAction)volumeChanged:(NSSlider*)sender
{
    self.audioPlayer.volume = sender.doubleValue;
}
@end
