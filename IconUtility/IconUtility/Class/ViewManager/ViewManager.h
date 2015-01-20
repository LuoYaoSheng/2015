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

@property (nonatomic, retain) NSView *contentView;
@property (nonatomic, retain) NSArray *icons;
@property (nonatomic, retain) NSArray *childViews;

- (id)initWithContentView:(NSView *)aView;
- (void)redraw:(id)sender;

@end
