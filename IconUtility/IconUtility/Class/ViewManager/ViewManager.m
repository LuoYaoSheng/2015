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

- (void)setupChildviews{
    
//    mImage
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    for (int idx = TAG_img_icon; idx <= TAG_img_defalut; idx++) {
        IconImageView *vIcon = [(NSView *)self.contentView viewWithTag: idx ];
        
        if ( vIcon ){
            vIcon.imageName = [NSString stringWithFormat:@"%d.png", idx];
            vIcon.imageWidth = ICON_WIDTH(idx==TAG_img_icon);
            vIcon.imageHeight = ICON_HIGHT(idx==TAG_img_icon);;
            [mutableArray addObject:vIcon];
        }
    }

    self.childViews = mutableArray;
}

@end