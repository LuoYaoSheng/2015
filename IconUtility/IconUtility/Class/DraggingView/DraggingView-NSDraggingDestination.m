//
//  DraggingView-NSDraggingDestination.m
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import "DraggingView-NSDraggingDestination.h"
#import "DraggingView-NSDraggingDestination.h"
#import "DraggingNotification.h"

@implementation DraggingView (NSDraggingDestination)

- (NSDragOperation)draggingEntered:(id < NSDraggingInfo >) sender{
    self.highlighted = YES;
    return NSDragOperationCopy;
}

- (void)draggingExited:(id < NSDraggingInfo >) sender{
    self.highlighted = NO;
}

- (BOOL)prepareForDragOperation:(id < NSDraggingInfo >) sender{
    return YES;
}

- (BOOL)performDragOperation:(id < NSDraggingInfo >) sender{
    NSPasteboard *pb = [sender draggingPasteboard];
    
    if ([NSImage canInitWithPasteboard:pb]){
        self.targetImage = [[NSImage alloc] initWithPasteboard:pb];
        return YES;
    }
    
    return NO;
}

- (void)concludeDragOperation:(id < NSDraggingInfo >) sender{
    NSNotification *aNotification = [NSNotification notificationWithName:DraggingConcludedNotification object:self];
    [[NSNotificationCenter defaultCenter] postNotification:aNotification];
    self.highlighted = NO;
}

@end
