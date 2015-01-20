//
//  ViewManager-SaveImages.m
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import "ViewManager-SaveImages.h"
#import "NSBitmapImageRep-Additions.h"
#import "IconImageView.h"

//Private
static NSString * const DefaultDirectoryName = @"com.borealkiss.IconUtility";

@implementation ViewManager (SaveImages)

-(BOOL)saveImages:(id)sender
{
    for (IconImageView *aView in self.childViews){
        if ([aView targetImage] == nil) {
            return NO;
        }
    }
    
    //Creates a directory for all images.
    NSString *path2Directory = [self pathToDirectory];
    
    for (IconImageView *aView in self.childViews){
        NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithPixelsWide:aView.imageWidth pixelsHigh:aView.imageHeight hasAlpha:YES];
        [imageRep setImage:aView.image];
        NSData *imageData = [imageRep representationUsingType:NSPNGFileType properties:nil];
        NSString *path2File = [path2Directory stringByAppendingPathComponent:aView.imageName];
        [imageData writeToFile:path2File atomically:NO];
    }
    
    return YES;
}

- (BOOL)hasImages
{
    for (IconImageView *aView in self.childViews){
        if ([aView targetImage] == nil) {
            return NO;
        }
    }
    return YES;
}

#pragma mark -
#pragma mark Private

/**
 * Returns a path to the existing directory that images are saved in.
 */
-(NSString *)pathToDirectory{
    NSString *path2Desktop = [NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path2ParentDirectory = [path2Desktop stringByAppendingPathComponent:DefaultDirectoryName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path2ParentDirectory] == NO){
        //Creates a parent directory if not existed.
        [[NSFileManager defaultManager] createDirectoryAtPath:path2ParentDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    int index = 1;
    NSString *aPath = [path2ParentDirectory stringByAppendingPathComponent:[self untitleDirectoryNameWithIndex:index]];
    
    while ([[NSFileManager defaultManager] fileExistsAtPath:aPath]) {
        //Changes a search path.
        index++;
        aPath = [path2ParentDirectory stringByAppendingPathComponent:[self untitleDirectoryNameWithIndex:index]];
    }
    
    //Create a directory.
    [[NSFileManager defaultManager] createDirectoryAtPath:aPath withIntermediateDirectories:NO attributes:nil error:nil];
    
    return aPath;
}

-(NSString *)untitleDirectoryNameWithIndex:(NSUInteger)index{
    static NSString *Untitle = @"Untitle";
    return [NSString stringWithFormat:@"%@%ld", Untitle, index];;
}

@end