//
//  SinglegameScene.cpp
//  CocosProject
//
//  Created by 罗耀生 on 15/1/20.
//
//

#include "SinglegameScene.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "LoginScene.h"
#include "WelcomeScene.h"

USING_NS_CC;

using namespace cocostudio::timeline;

enum{
    ToolBar_msg = 100,
    ToolBar_robot,
    ToolBar_set,
    ToolBar_back,
};

enum{
    PB_close = 100,
};

enum{
    PBM_net = 100,
    PBM_back ,
};


Scene* SinglegameScene::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = SinglegameScene::create();
    
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool SinglegameScene::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }
    
    
    
    auto rootNode = CSLoader::createNode("SinglegameScene.csb");
    addChild(rootNode);
    
    _Toolbar = static_cast<ui::Layout*>(rootNode->getChildByName("Toolbar"));
    
    _Panel_Back = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Back"));
    _Panel_Back_Menu = static_cast<ui::Layout*>(_Panel_Back->getChildByName("Panel_Menu"));
    
    _Panel_Msg = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Msg"));
    _Panel_Msg_Menu = static_cast<ui::Layout*>(_Panel_Msg->getChildByName("Panel_Menu"));
    
    _Panel_Set = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Set"));
    _Panel_Set_Menu = static_cast<ui::Layout*>(_Panel_Set->getChildByName("Panel_Menu"));
    
    _Panel_Robot = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Robot"));
    _Panel_Robot_Menu = static_cast<ui::Layout*>(_Panel_Robot->getChildByName("Panel_Menu"));
    
    
    //界面事件绑定
    this->Listener_Toolbar();
    this->Listener_PanelBack();
    this->Listener_PanelMsg();
    this->Listener_PanelSet();
    this->Listener_PanelRobot();
    
    return true;
}

#pragma mark - Listener
void SinglegameScene::Listener_Toolbar()
{
    for (int idx = ToolBar_msg; idx <= ToolBar_back; idx++) {
        auto item = static_cast<ui::Button*>(_Toolbar->getChildByTag( idx ) );
        item->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::ToolbarCallback, this));
    }
}
void SinglegameScene::Listener_PanelBack()
{
    auto closeItem = static_cast<ui::Button*>(_Panel_Back->getChildByName("BtnClose"));
    closeItem->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelBackCallback, this));
    
    for (int idx = PBM_net; idx <= PBM_back; idx++) {
        auto item = static_cast<ui::Button*>(_Panel_Back_Menu->getChildByTag( idx ) );
        item->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelBackPanelMenuCallback, this));
    }
}
void SinglegameScene::Listener_PanelMsg()
{
    auto closeItem = static_cast<ui::Button*>(_Panel_Msg->getChildByName("BtnClose"));
    closeItem->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelMsgCallback, this));
}
void SinglegameScene::Listener_PanelSet()
{
    auto closeItem = static_cast<ui::Button*>(_Panel_Set->getChildByName("BtnClose"));
    closeItem->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelSetCallback, this));
}
void SinglegameScene::Listener_PanelRobot()
{
    auto closeItem = static_cast<ui::Button*>(_Panel_Robot->getChildByName("BtnClose"));
    closeItem->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelRobotCallback, this));
}

#pragma mark - btn action
void SinglegameScene::menuCloseCallback(Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
    }
}

void SinglegameScene::ToolbarCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
        ui::Button* btn = static_cast<ui::Button*>(pSender);
        switch ( btn->getTag() ) {
            case ToolBar_msg:
            {
                _Panel_Msg->setVisible( true );
            }
                break;
            case ToolBar_robot:
            {
                _Panel_Robot->setVisible( true );
            }
                break;
            case ToolBar_set:
            {
                _Panel_Set->setVisible( true );
            }
                break;
                
            default:
            {
                _Panel_Back->setVisible( true );
            }
                break;
        }
    }
}
void SinglegameScene::PanelBackCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) _Panel_Back->setVisible(false);
}
void SinglegameScene::PanelBackPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
        ui::Button* btn = static_cast<ui::Button*>(pSender);
        switch ( btn->getTag() ) {
            case PBM_net:
            {
                auto scene = LoginScene::createScene();
                Director::getInstance()->runWithScene( scene );
            }
                break;
            default:
            {
                auto scene = WelcomeScene::createScene();
                Director::getInstance()->runWithScene( scene );
            }
                break;
        }
    }
    
}
void SinglegameScene::PanelMsgCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) _Panel_Msg->setVisible(false);
}
void SinglegameScene::PanelMsgPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    
}
void SinglegameScene::PanelSetCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) _Panel_Set->setVisible(false);
}
void SinglegameScene::PanelSetPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    
}
void SinglegameScene::PanelRobotCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) _Panel_Robot->setVisible(false);
}
void SinglegameScene::PanelRobotPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    
}
