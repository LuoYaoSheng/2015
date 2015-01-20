//
//  NSBitmapImageRep-Additions.m
//  Create
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import "NSBitmapImageRep-Additions.h"
//Private
static const NSInteger DefaultBitsPerSample		= 8;
static const NSInteger DefaultSamplesPerPixel	= 4;
static const NSInteger BitsPerByte				= 8;

@implementation NSBitmapImageRep (Additions)

+ (NSBitmapImageRep *)imageRepWithPixelsWide:(NSInteger)width pixelsHigh:(NSInteger)height hasAlpha:(BOOL)alpha{
    return [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL
                                                    pixelsWide:width
                                                    pixelsHigh:height
                                                 bitsPerSample:DefaultBitsPerSample
                                               samplesPerPixel:DefaultSamplesPerPixel
                                                      hasAlpha:alpha
                                                      isPlanar:NO
                                                colorSpaceName:NSCalibratedRGBColorSpace
                                                   bytesPerRow:0
                                                  bitsPerPixel:0];
}


- (NSImage *)image{
    NSInteger w = [self pixelsWide];
    NSInteger h = [self pixelsHigh];
    NSInteger bpr = [self bytesPerRow];
    NSInteger bpp = [self bitsPerPixel];
    NSInteger bps = [self bitsPerSample];
    
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, [self bitmapData], h * bpr, NULL);
    CGImageRef cgImage = CGImageCreate(w,
                                       h,
                                       bps,
                                       bpp,
                                       bpr,
                                       [[self colorSpace] CGColorSpace],
                                       kCGImageAlphaPremultipliedLast,
                                       dataProvider,
                                       NULL,
                                       YES,
                                       kCGRenderingIntentDefault);
    
    CGDataProviderRelease(dataProvider);
    NSImage *nsImage = [[NSImage alloc] initWithCGImage:cgImage size:NSZeroSize];
    CGImageRelease(cgImage);
    
    return nsImage;
}


- (void)setImage:(NSImage *)anImage interpolationQuality:(CGInterpolationQuality)quality{
    NSInteger w = [self pixelsWide];
    NSInteger h = [self pixelsHigh];
    NSInteger bpr = [self bytesPerRow];
    NSInteger bps = [self bitsPerSample];
    
    CGImageRef cgImage = [anImage CGImageForProposedRect:NULL context:nil hints:nil];
    
    CGContextRef context = CGBitmapContextCreate([self bitmapData], 
                                                 w, 
                                                 h, 
                                                 bps, 
                                                 bpr, 
                                                 [[self colorSpace] CGColorSpace], 
                                                 kCGImageAlphaPremultipliedLast);
    
    //Considers CG's interpolation algorithms.
    CGContextSetInterpolationQuality(context, quality);
    
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), cgImage);
    CGContextRelease(context);
}


- (void)setImage:(NSImage *)anImage{
    [self setImage:anImage interpolationQuality:kCGInterpolationDefault];
}

@end
