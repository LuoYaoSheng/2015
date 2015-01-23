//
//  NSBitmapImageRep-Additions.h
//  Create
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * Additional category for convenience purpose.
 */
@interface NSBitmapImageRep (Additions)

/**
 * The convenience method.
 */
+ (NSBitmapImageRep *)imageRepWithPixelsWide:(NSInteger)width pixelsHigh:(NSInteger)height hasAlpha:(BOOL)alpha;

/**
 * Returns an NSImage object from the current bimap plane.
 */
- (NSImage *)image;

/**
 * The image will be disproportionately drwan in the bitmap plane of the receiver,
 * using CoreGraphics' interporation quality algorithm.
 */
- (void)setImage:(NSImage *)anImage interpolationQuality:(CGInterpolationQuality)quality;

/**
 * The image will be disproportionately drwan in the bitmap plane of the receiver,
 * using CoreGraphics' default interporation quality algorithm.
 */
- (void)setImage:(NSImage *)anImage;

@end
