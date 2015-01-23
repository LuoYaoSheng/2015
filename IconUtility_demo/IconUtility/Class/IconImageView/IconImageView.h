//
//  IconImageView.h
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * Image view for icons.
 */
@interface IconImageView : NSImageView 
@property (nonatomic, assign) CGFloat imageWidth;
@property (nonatomic, assign) CGFloat imageHeight;
@property (nonatomic, retain) NSString *imageName;
@property (nonatomic, retain) NSImage *targetImage;

@end
