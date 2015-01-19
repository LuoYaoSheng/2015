//
//  MainWindow.m
//  IconUtility
//
//  Created by 罗耀生 on 15/1/18.
//  Copyright (c) 2015年 LuoYaoSheng. All rights reserved.
//

#import "MainWindow.h"
#import "ViewManager.h"

@implementation MainWindow

-(id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
    if ( self != nil) {
        
        _viewManager = [[ViewManager alloc] initWithContentView:[self contentView]];
    }
    return self;
}

@end
