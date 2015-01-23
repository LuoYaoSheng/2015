//
//  DraggingView.m
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import "DraggingView.h"

@implementation DraggingView
@synthesize targetImage = _targetImage;
@synthesize highlighted = _highlighted;

-(void)awakeFromNib{
    [self registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, NSTIFFPboardType, nil]];
    [self setup];
}

-(void)drawRect:(NSRect)dirtyRect{
    if (_highlighted) {
        [[NSColor blueColor] set];
        NSFrameRect([self bounds]);
    }
}

#pragma mark -
#pragma mark Accessors

-(void)setHighlighted:(BOOL)yn{
    _highlighted = yn;
    [self setNeedsDisplay:YES];
}

#pragma mark -
#pragma mark Private

-(void)setup{
    self.highlighted = NO;
}

@end