//
//  WelcomeScene.cpp
//  CocosProject
//
//  Created by 罗耀生 on 15/1/20.
//
//

#include "WelcomeScene.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "LobbyScene.h"
#include "LoginScene.h"
#include "SinglegameScene.h"

USING_NS_CC;

using namespace cocostudio::timeline;


Scene* WelcomeScene::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = WelcomeScene::create();
    
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool WelcomeScene::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }
    
    auto rootNode = CSLoader::createNode("WelcomeScene.csb");
    
    addChild(rootNode);
    
    auto netItem = static_cast<ui::Button*>(rootNode->getChildByName("Net"));
    netItem->addTouchEventListener(CC_CALLBACK_2(WelcomeScene::menuCloseCallback, this));
    
    auto signalItem = static_cast<ui::Button*>(rootNode->getChildByName("Signal"));
    signalItem->addTouchEventListener(CC_CALLBACK_2(WelcomeScene::menuCloseCallback, this));
    
    auto setItem = static_cast<ui::Button*>(rootNode->getChildByName("Set"));
    setItem->addTouchEventListener(CC_CALLBACK_2(WelcomeScene::menuCloseCallback, this));
    
    auto helpItem = static_cast<ui::Button*>(rootNode->getChildByName("Help"));
    helpItem->addTouchEventListener(CC_CALLBACK_2(WelcomeScene::menuCloseCallback, this));
    
    return true;
}

void WelcomeScene::menuCloseCallback(Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
        ui::Button* btn = static_cast<ui::Button*>(pSender);
        switch ( btn->getTag() ) {
            case 100:
            {
                auto scene = LoginScene::createScene();
//                Director::getInstance()->runWithScene( scene );
                Director::getInstance()->pushScene( scene );
            }
                break;
            case 101:
            {
                auto scene = SinglegameScene::createScene();
                Director::getInstance()->runWithScene( scene );
            }
                break;
                
            default:
                break;
        }
    }
}
