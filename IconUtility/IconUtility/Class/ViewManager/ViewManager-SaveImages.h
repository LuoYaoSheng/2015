//
//  ViewManager-SaveImages.h
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ViewManager.h"

/**
 * Save functionalities.
 */
@interface ViewManager (SaveImages)
- (BOOL)saveImages:(id)sender;
- (BOOL)hasImages;
@end
