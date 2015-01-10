//
//  SpriteTouchLayer.cpp
//  lys
//
//  Created by 罗耀生 on 15/1/10.
//
//

#include "SpriteTouchLayer.h"
USING_NS_CC;

SpriteTouchLayer::SpriteTouchLayer(){
    
    _clicked = false;
}

SpriteTouchLayer::~SpriteTouchLayer(){
    
}

bool SpriteTouchLayer::init(){
    
    if ( !LayerColor::init() ){
        return false;
    }
    return true;
}

SpriteTouchLayer* SpriteTouchLayer::create(Rect rt){
    
    SpriteTouchLayer *pRet = new SpriteTouchLayer( );
    if (pRet && pRet->init())
    {
        pRet->_rect = rt;
        pRet->autorelease();
        return pRet;
    }
    CC_SAFE_DELETE( pRet );
    return nullptr;
}

void SpriteTouchLayer::onEnter()
{
    LayerColor::onEnter();
    this->addTouchEvent();
}
void SpriteTouchLayer::onExit()
{
    LayerColor::onExit();
    _eventDispatcher->removeEventListener( _myListener );
}

void SpriteTouchLayer::addTouchEvent()
{
    _myListener = EventListenerTouchOneByOne::create();
    _myListener->setSwallowTouches( true );
    _myListener->onTouchBegan = [=](Touch* touch,Event* event)
    {
        Vec2 touchLocation = touch->getLocation();
        Sprite *parent = dynamic_cast<Sprite*> (this->getParent() );
        
        Vec2 local = parent->convertToNodeSpace(touchLocation);
        _rect.origin = Vec2::ZERO;
        
        if ( _rect.containsPoint(local) )
        {
            _startTouch = touch->getLocation(); //（坐标原点在左下角）
            
            if ( _clicked ) {
                _clicked = false;
                onDoubleClick();
            }else{
                scheduleOnce(schedule_selector(SpriteTouchLayer::onSingleCLick), 0.25f);
                _clicked = true;
            }
        }
        
        return true;
    };

    
    //注册监听
    auto dispatcher = Director::getInstance()->getEventDispatcher();
    dispatcher->addEventListenerWithFixedPriority( _myListener, 200);
}

void SpriteTouchLayer::onSingleCLick(float tt)
{
    if ( _clicked) {
        _clicked = false;
        onSingleCLick();
    }
}

void SpriteTouchLayer::onSingleCLick()
{
    CCLOG("单击");
}
void SpriteTouchLayer::onDoubleClick()
{
    CCLOG("双击");
}