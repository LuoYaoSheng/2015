//
//  ViewManager.h
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * Manages icon image views and the saving function.
 */
@interface ViewManager : NSObject

@property (nonatomic, strong) NSView *contentView;
@property (nonatomic, strong) NSArray *icons;
@property (nonatomic, strong) NSArray *childViews;
@property (nonatomic, strong) NSImage *mImage;

- (id)initWithContentView:(NSView *)aView;
- (void)redraw:(id)sender;

@end
