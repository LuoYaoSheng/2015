//
//  ViewManager-NSNotification.m
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import "ViewManager-NSNotification.h"
#import "DraggingNotification.h"
#import "DraggingView.h"
#import "IconImageView.h"

@implementation ViewManager (_NSNotification)

-(void)subscribe{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(draggingConcludedHandler:)
                                                 name:DraggingConcludedNotification
                                               object:nil];
}

-(void)unsubscribe{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)draggingConcludedHandler:(NSNotification *)aNotification{
    DraggingView *aView = (DraggingView *)[aNotification object];
    
    for (IconImageView *childView in self.childViews){
        [childView setTargetImage:[aView targetImage]];
    }
}

@end