//
//  SinglegameScene.h
//  CocosProject
//
//  Created by 罗耀生 on 15/1/20.
//
//

#ifndef __CocosProject__SinglegameScene__
#define __CocosProject__SinglegameScene__

#include "cocos2d.h"

#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "extensions/cocos-ext.h"

USING_NS_CC;
USING_NS_CC_EXT;
using namespace cocos2d::ui;

class SinglegameScene : public cocos2d::Layer
{
public:
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::Scene* createScene();
    
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();
    
    virtual void onEnterTransitionDidFinish();

    
    // a selector callback
    void menuCloseCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    
    // implement the "static create()" method manually
    CREATE_FUNC(SinglegameScene);
    
protected:
    void Listener_Toolbar();
    void Listener_PanelBack();
    void Listener_PanelMsg();
    void Listener_PanelSet();
    void Listener_PanelRobot();
    
    void ToolbarCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelBackCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelBackPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelMsgCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelMsgPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelSetCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelSetPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelRobotCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelRobotPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    
private:
    ui::Layout* _Toolbar;
    ui::Layout* _Panel_Back;
    ui::Layout* _Panel_Back_Menu;
    ui::Layout* _Panel_Msg;
    ui::Layout* _Panel_Msg_Menu;
    ui::Layout* _Panel_Set;
    ui::Layout* _Panel_Set_Menu;
    ui::Layout* _Panel_Robot;
    ui::Layout* _Panel_Robot_Menu;
};

#endif /* defined(__CocosProject__SinglegameScene__) */
