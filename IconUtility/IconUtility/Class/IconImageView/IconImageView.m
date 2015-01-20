//
//  IconImageView.m
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import "IconImageView.h"
#import "NSBitmapImageRep-Additions.h"
#import "QualityManager.h"

@implementation IconImageView
- (void)setTargetImage:(NSImage *)anImage
{
    if (_targetImage != anImage) _targetImage = anImage;
    [self resizeImage:_targetImage];
}

#pragma mark -
#pragma mark Private

-(void)resizeImage:(NSImage *)anImage
{
    NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithPixelsWide:_imageWidth pixelsHigh:_imageHeight hasAlpha:YES];
    [imageRep setImage:anImage interpolationQuality:[[QualityManager sharedInstance] quality]];
    NSData *imageData = [imageRep representationUsingType:NSPNGFileType properties:nil];
    NSImage *newImage = [[NSImage alloc] initWithData:imageData];
    [self setImage:newImage];
}

@end