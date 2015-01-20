//
//  DraggingView.h
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * Drag&Drop detecting view fully convered on the main window's content view.
 */
@interface DraggingView : NSView
@property (nonatomic, retain) NSImage *targetImage;
@property (nonatomic, assign) BOOL highlighted;

@end
