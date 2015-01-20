//
//  ViewManager-NSNotification.h
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ViewManager.h"

/**
 * Private.
 */
@interface ViewManager (_NSNotification)
-(void)subscribe;
-(void)unsubscribe;
-(void)draggingConcludedHandler:(NSNotification *)aNotification;
@end
