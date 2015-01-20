//
//  ViewController.m
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/CoreAnimation.h>
#import "ViewManager-SaveImages.h"
#import "ViewManager.h"
#import "QualityManager.h"
#import "Common.h"


//Private
static NSString * const ImagesDidSaveString = @"Images saved to the desktop.";
static NSString * const CautionString		= @"Drag images on the window.";
static NSString * const NoSelectAnyItems    = @"Did not select any items";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    _checkArray= [[NSMutableArray alloc]init];
    for (int idx = 0; idx < TAG_round - TAG_osx; idx++) {
        [_checkArray addObject:[NSNumber numberWithInt:0]];
    }
    
    _viewManager = [[ViewManager alloc] initWithContentView: self.view ];
    [self setupAnimations];
    NSView *vDefalut = [self.view viewWithTag: TAG_img_defalut ];
    [vDefalut setAlphaValue:0.0f];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

//Animation part.
-(void)setupAnimations{
    NSDictionary *animationDict = [NSDictionary dictionaryWithObjectsAndKeys:[self fadeoutAnimation], @"alphaValue", nil];
    [_messageLabel setAnimations:animationDict];
}

//Animation part.
-(void)showLabelWithTitle:(NSString *)title textColor:(NSColor *)color{
    if (color == nil){
        [_messageLabel setTextColor:[NSColor blackColor]];
    }
    else{
        [_messageLabel setTextColor:color];
    }
    
    [_messageLabel setHidden:NO];
    [_messageLabel setAlphaValue:0.0];
    [_messageLabel setTitleWithMnemonic:title];
    [[_messageLabel animator] setAlphaValue:1.0];
    [self hideLabelAfterDelay:3.0];
}

//Animation part.
-(void)hideLabelAfterDelay:(NSTimeInterval)delay{
    [self performSelector:@selector(hideLabel) withObject:nil afterDelay:delay];
}

//Animation part.
-(void)hideLabel{
    [[_messageLabel animator] setAlphaValue:0.0];
}

//Animation part.
-(CABasicAnimation *)fadeoutAnimation{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    return animation;
}

#pragma mark - button action
-(IBAction)saveButtonPressed:(id)sender{
    
    BOOL isHasCheck = NO;
    for (NSNumber *number in _checkArray) {
        if ( [number boolValue] ) {
            isHasCheck = YES;
            break;
        }
    }
    if ( !isHasCheck ) {
        [self showLabelWithTitle:NoSelectAnyItems textColor:[NSColor blueColor]];
        return;
    }
    
    _viewManager.icons = _checkArray;
    if ([ _viewManager saveImages:self]){
        [self showLabelWithTitle:ImagesDidSaveString textColor:[NSColor blueColor]];
        return;
    }
    
    [self showLabelWithTitle:CautionString textColor:[NSColor redColor]];
}

- (IBAction)chekcAction:(id)sender
{
    NSButton *btn = (NSButton *)sender;
    
    switch ( btn.tag ) {
        case TAG_defalut:
        {
            if ( ![_viewManager hasImages] ) {
                [btn setState: !btn.state];
                [self showLabelWithTitle:CautionString textColor:[NSColor redColor]];
                return;
            }
            [_checkArray replaceObjectAtIndex: btn.tag - TAG_img_icon withObject: [NSNumber numberWithInt:btn.state]];
            
            NSView *vIcon = [self.view viewWithTag: TAG_img_icon ];
            NSView *vDefalut = [self.view viewWithTag: TAG_img_defalut ];
            
            if ( btn.state ) {
                [[vIcon animator] setFrame:NSRectFromCGRect(CGRectMake(17, 17, 108, 108))];
                [[vDefalut animator] setAlphaValue:1.0];
            }else{
                [[vIcon animator] setFrame:NSRectFromCGRect(CGRectMake(154, 20, 280, 280))];
                [[vDefalut animator] setAlphaValue:0.0];
            }
        }
            break;
            
            case TAG_shine:
            case TAG_round:
        {
            
        }
            break;
            
        default:
            [_checkArray replaceObjectAtIndex: btn.tag - TAG_osx withObject: [NSNumber numberWithInt:btn.state]];
            break;
    }
}

@end
