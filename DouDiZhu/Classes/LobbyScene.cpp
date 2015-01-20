//
//  LobbyScene.cpp
//  CocosProject
//
//  Created by 罗耀生 on 15/1/20.
//
//

#include "LobbyScene.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"

USING_NS_CC;

using namespace cocostudio::timeline;

Scene* LobbyScene::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = LobbyScene::create();
    
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool LobbyScene::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }
    
    auto rootNode = CSLoader::createNode("LobbyScene.csb");
    
    addChild(rootNode);

    
    return true;
}

void LobbyScene::menuCloseCallback(Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
    }
}
