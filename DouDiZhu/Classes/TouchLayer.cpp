//
//  TouchLayer.cpp
//  lys
//
//  Created by 罗耀生 on 15/1/9.
//
//

#include "TouchLayer.h"
USING_NS_CC;

bool TouchLayer::init(){
    
    if ( !LayerColor::init() ){
        return false;
    }
    
    _isMoved = false;
    _clicked = false;
    
    return true;
}

void TouchLayer::onEnter()
{
    Node::onEnter();
    this->addTouchEvent();
}
void TouchLayer::onExit()
{
    Node::onExit();
    _eventDispatcher->removeEventListener( _myListener );
}

void TouchLayer::addTouchEvent()
{
    _myListener = EventListenerTouchOneByOne::create();
    _myListener->setSwallowTouches( false );
    _myListener->onTouchBegan = [=](Touch* touch,Event* event)
    {
        _myListener->setSwallowTouches( false );
        
        _startTouch = touch->getLocation(); //（坐标原点在左下角）
        
        if ( _clicked ) {
            _clicked = false;
            onDoubleClick();
        }else{
            scheduleOnce(schedule_selector(TouchLayer::onSingleCLick), 0.25f);
            _clicked = true;
        }
        
        return true;
    };
    
    _myListener->onTouchMoved = [=](Touch* touch,Event* event)
    {
        _myListener->setSwallowTouches( true );
        this->onMove( touch->getLocation() );
    };
    
    _myListener->onTouchEnded = [=](Touch* touch,Event* event)
    {
        _myListener->setSwallowTouches( false );
    };
    
    //注册监听
    auto dispatcher = Director::getInstance()->getEventDispatcher();
    dispatcher->addEventListenerWithFixedPriority( _myListener, 200);
    dispatcher->addEventListenerWithSceneGraphPriority( _myListener, this);
}

void TouchLayer::onSingleCLick(float tt)
{
    if ( _clicked ) {
        _clicked = false;
        onSingleCLick();
    }
}

void TouchLayer::onSingleCLick()
{
    if ( delegate != nullptr) {
        delegate->onSingleCLick( _startTouch );
    }
}
void TouchLayer::onDoubleClick()
{
    if ( _isMoved ) _isMoved = false;
    if ( delegate != nullptr) {
        delegate->onDoubleClick( _startTouch );
    }
}

void TouchLayer::onMove(cocos2d::Point pt)
{
    if ( delegate != nullptr) {
        delegate->onMove( pt );
    }
}

