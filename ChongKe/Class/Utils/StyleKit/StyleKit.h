//
//  StyleKit.h
//  MShops
//
//  Created by 池晓生 on 14/12/17.
//  Copyright (c) 2014 云起互动. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface StyleKit : NSObject

// iOS Controls Customization Outlets
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* defaultAvatarFocusTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* defaultAvatarTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* searchIconTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* searchIconFocusTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* closeIconTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* titleSignOfTopicTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* topicSignOfDingTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* topicSignOfJingTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* backTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* backSelectedTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* dotTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* dotSelectedTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* arrowRightTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* progressBarTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* loginTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* loginFocusTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* switchOnTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* switchOffTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* passwordBoxTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* fullInputBoxTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* rushToBuyTargets;

// Colors
+ (UIColor*)baseColor;
+ (UIColor*)colorOfWhite;
+ (UIColor*)colorOfRed;
+ (UIColor*)colorOfGreen;
+ (UIColor*)colorOfSearchInput;
+ (UIColor*)colorOfPlaceholder;
+ (UIColor*)colorOfBaseDeep;
+ (UIColor*)colorOfMenuNormal;
+ (UIColor*)colorOfMenuSelected;
+ (UIColor*)colorOfButtonClickDefault;
+ (UIColor*)colorOfTextNormal;
+ (UIColor*)colorOfBaseBackground;
+ (UIColor*)countDownTimeBoardLine;
+ (UIColor*)colorOfTips;
+ (UIColor*)colorOfTextLight;
+ (UIColor*)colorOfTextLightLess;
+ (UIColor*)colorOfTextLightMore;
+ (UIColor*)colorOfSpLine;
+ (UIColor*)colorOfSucc;
+ (UIColor*)colorOfProgress;
+ (UIColor*)colorOfAlertView;

// Drawing Methods
+ (void)drawTimeCountDownBoardWithPHour: (NSString*)pHour pMinute: (NSString*)pMinute pSecond: (NSString*)pSecond;
+ (void)drawTimeCountDownDisabledWithPTitle: (NSString*)pTitle;

// Generated Images
+ (UIImage*)imageOfDefaultAvatarFocus;
+ (UIImage*)imageOfDefaultAvatar;
+ (UIImage*)imageOfSearchIcon;
+ (UIImage*)imageOfSearchIconFocus;
+ (UIImage*)imageOfCloseIcon;
+ (UIImage*)imageOfTitleSignOfTopic;
+ (UIImage*)imageOfTopicSignOfDing;
+ (UIImage*)imageOfTopicSignOfJing;
+ (UIImage*)imageOfBack;
+ (UIImage*)imageOfBackSelected;
+ (UIImage*)imageOfDot;
+ (UIImage*)imageOfDotSelected;
+ (UIImage*)imageOfExpressSignWithPTitle: (NSString*)pTitle;
+ (UIImage*)imageOfArrowRight;
+ (UIImage*)imageOfProgressBar;
+ (UIImage*)imageOfLogin;
+ (UIImage*)imageOfLoginFocus;
+ (UIImage*)imageOfSwitchOn;
+ (UIImage*)imageOfSwitchOff;
+ (UIImage*)imageOfPasswordBox;
+ (UIImage*)imageOfFullInputBox;
+ (UIImage*)imageOfRebateTagWithPRebate: (NSString*)pRebate;
+ (UIImage*)imageOfRushToBuy;

@end