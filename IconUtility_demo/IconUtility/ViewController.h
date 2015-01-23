//
//  ViewController.h
//  IconUtility
//
//  Created by Air on 15/1/19.
//  Copyright (c) 2015年 罗耀生. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ViewManager;

@interface ViewController : NSViewController

@property (nonatomic, retain) ViewManager *viewManager;
@property (nonatomic, retain) NSMutableArray *checkArray;

@property (weak) IBOutlet NSTextField *messageLabel;

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)chekcAction:(id)sender;

@end

