//
//  ViewManager.m
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import "ViewManager.h"
#import "ViewManager-SaveImages.h"
#import "ViewManager-NSNotification.h"
#import "IconImageView.h"
#import "Common.h"

//Private
static NSString * const IconsFileName			= @"Icons";
static NSString * const IconsFileType			= @"plist";
static NSString * const IconsNameKey			= @"Name";
static NSString * const IconsSizeKey			= @"Size";
static NSString * const IconsTagKey				= @"Tag";

@implementation ViewManager

- (id)initWithContentView:(NSView *)aView
{
    if (self = [super init]){
        self.contentView = aView;
        [self setup];
    }
    return self;
}

- (void)redraw:(id)sender
{
    for (IconImageView *childView in self.childViews){
        [childView setTargetImage:[childView targetImage]];
    }
}

#pragma mark -
#pragma mark Private

-(void)setup{
    [self subscribe];
    [self setupChildviews];
}

-(void)setupChildviews{
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    for (int idx = TAG_img_icon; idx <= TAG_img_defalut; idx++) {
        IconImageView *vIcon = [(NSView *)self.contentView viewWithTag: idx ];
        
        if ( vIcon ){
            vIcon.imageName = [NSString stringWithFormat:@"%d", idx];
            vIcon.imageWidth = ICON_WIDTH(idx==TAG_img_icon);
            vIcon.imageHeight = ICON_HIGHT(idx==TAG_img_icon);;
            [mutableArray addObject:vIcon];
        }
    }

    self.childViews = mutableArray;
    
    /*
    NSString *filePath = [[NSBundle mainBundle] pathForResource:IconsFileName ofType:IconsFileType];
    self.icons = [NSArray arrayWithContentsOfFile:filePath];
    
    //Temporal
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in self.icons){
        NSString *name = [dict objectForKey:IconsNameKey];
        NSInteger tag = [(NSNumber *)[dict objectForKey:IconsTagKey] integerValue];
        CGFloat size = [(NSNumber *)[dict objectForKey:IconsSizeKey] floatValue];
        
        IconImageView *aView = [(NSView *)self.contentView viewWithTag:tag];
        
        if (aView){
            aView.imageName = name;
            aView.imageWidth = size;
            aView.imageHeight = size;
            [mutableArray addObject:aView];
        }
    }
    
    self.childViews = mutableArray;
     */
}

@end