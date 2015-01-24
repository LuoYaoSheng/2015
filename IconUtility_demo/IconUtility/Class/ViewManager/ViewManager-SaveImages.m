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
#import "Common.h"

//Private


@implementation ViewManager (SaveImages)

-(BOOL)saveImages:(id)sender
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"IconsName" ofType:@"plist"];
    // 读取到一个NSDictionary
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    for (IconImageView *aView in self.childViews){
        if ([aView targetImage] == nil) {
            return NO;
        }
    }
    
    for (int idx = 0; idx < self.icons.count; idx++) {
        BOOL b = [[self.icons objectAtIndex:idx]boolValue];
        if ( b ) {
            NSString *iconName = [FILENAMELIST objectAtIndex:idx];
            NSString *path2Directory = [self pathToDirectory: iconName ];
            NSArray *array = [dictionary objectForKey: iconName ];

                for (NSDictionary *dic in array) {

                    NSString *name = [dic objectForKey:@"Name"];
                    float width = [[dic objectForKey:@"Width"]floatValue];
                    float hight = [[dic objectForKey:@"Hight"]floatValue];
                    
                    NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithPixelsWide:width pixelsHigh:hight hasAlpha:YES];
                    [imageRep setImage: self.mImage ];
                    NSData *imageData = [imageRep representationUsingType:NSPNGFileType properties:nil];
                    NSString *path2File = [path2Directory stringByAppendingPathComponent: name ];
                    [imageData writeToFile:path2File atomically:NO];
                }
        }
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
-(NSString *)pathToDirectory:(NSString *)pName
{
    NSString *path2Desktop = [NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path2ParentDirectory = [path2Desktop stringByAppendingPathComponent:DefaultDirectoryName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path2ParentDirectory] == NO){
        //Creates a parent directory if not existed.
        [[NSFileManager defaultManager] createDirectoryAtPath:path2ParentDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    int index = 1;
    NSString *aPath = [path2ParentDirectory stringByAppendingPathComponent: pName ];
    
//    while ([[NSFileManager defaultManager] fileExistsAtPath:aPath]) {
//        //Changes a search path.
//        index++;
//        aPath = [path2ParentDirectory stringByAppendingPathComponent: pName ];
//    }
    
    //Create a directory.
    [[NSFileManager defaultManager] createDirectoryAtPath:aPath withIntermediateDirectories:NO attributes:nil error:nil];
    
    return aPath;
}

@end