//
//  LoginScene.h
//  CocosProject
//
//  Created by 罗耀生 on 15/1/20.
//
//

#ifndef __CocosProject__LoginScene__
#define __CocosProject__LoginScene__

#include "cocos2d.h"

#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "extensions/cocos-ext.h"

USING_NS_CC;
USING_NS_CC_EXT;
using namespace cocos2d::ui;

class LoginScene : public cocos2d::Layer
{
public:
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::Scene* createScene();
    
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();
    
    // a selector callback
    void menuCloseCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    
    // implement the "static create()" method manually
    CREATE_FUNC(LoginScene);
};

#endif /* defined(__CocosProject__LoginScene__) */
