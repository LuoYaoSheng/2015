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
#include "TouchLayer.h"
#include "Poker.h"
#include "Robot.h"


USING_NS_CC;
USING_NS_CC_EXT;
using namespace cocos2d::ui;

class SinglegameScene : public cocos2d::Layer , public TouchLayerDelegate
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
    void Listener_PanelBaisc();
    void Listener_Toolbar();
    void Listener_PanelBack();
    void Listener_PanelMsg();
    void Listener_PanelSet();
    void Listener_PanelRobot();
    void Listener_PanelBubble();
    
    void PanelBasicCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelBasicPanelUserCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void ToolbarCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelBackCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelBackPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelMsgCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelMsgPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelSetCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelSetPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelRobotCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelRobotPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    void PanelBubbleCallback(cocos2d::Ref* pSender, Widget::TouchEventType);
    
protected:
    void UI_update_basic(bool isStart);
    
    void delCallback(Node* node);
    void showCallback(Node* node);
    void settleCallback(Node* node);
    void alertCallback(Node* node);
    void publicCallback(Node* node);
    void smallCallback(Node* node);
    
    void trunCallback(int trun);
    
private:
    ui::Layout* _Panel_Basic;
    ui::Layout* _Panel_Basic_User[3];
    ui::Layout* _Toolbar;
    ui::Layout* _Panel_Back;
    ui::Layout* _Panel_Back_Menu;
    ui::Layout* _Panel_Msg;
    ui::Layout* _Panel_Msg_Menu;
    ui::Layout* _Panel_Set;
    ui::Layout* _Panel_Set_Menu;
    ui::Layout* _Panel_Robot;
    ui::Layout* _Panel_Robot_Menu;
    ui::Layout* _Panel_Bubble;
    
    TouchLayer *_touchLayer;
    
private:
    void onSingleCLick(cocos2d::Vec2);             //单击
    void onDoubleClick(cocos2d::Vec2);             //双击
    void onMove(cocos2d::Vec2);                    //移动
    
    void onLongPressed(cocos2d::Vec2);             //长按
    void onTouchEnd();
private:
    Vector<Poker*> _vector;
    Sprite *_threeCards[3];
    bool _bCanTouch;
    
    Robot *_robot;
    
};

#endif /* defined(__CocosProject__SinglegameScene__) */
