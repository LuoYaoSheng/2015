//
//  LoginScene.cpp
//  CocosProject
//
//  Created by 罗耀生 on 15/1/20.
//
//

#include "LoginScene.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "LobbyScene.h"
#include "WelcomeScene.h"

USING_NS_CC;

using namespace cocostudio::timeline;

Scene* LoginScene::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = LoginScene::create();
    
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool LoginScene::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }
    
    auto rootNode = CSLoader::createNode("LoginScene.csb");
    
    addChild(rootNode);
    
    auto loginItem = static_cast<ui::Button*>(rootNode->getChildByName("Login"));
    loginItem->addTouchEventListener(CC_CALLBACK_2(LoginScene::menuCloseCallback, this));
    
    auto backItem = static_cast<ui::Button*>(rootNode->getChildByName("Back"));
    backItem->addTouchEventListener(CC_CALLBACK_2(LoginScene::menuCloseCallback, this));
    
    return true;
}

void LoginScene::menuCloseCallback(Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
        ui::Button *btn =  static_cast<ui::Button*>(pSender);
        
        if ( btn->getTag() == 100) {
            CCLOG("---");
            auto scene = LobbyScene::createScene();
            Director::getInstance()->runWithScene( scene );
        }else{
            auto scene = WelcomeScene::createScene();
            Director::getInstance()->runWithScene( scene );
        }
    }

}
