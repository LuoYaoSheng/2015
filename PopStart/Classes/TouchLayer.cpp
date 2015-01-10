//
//  TouchLayer.cpp
//  lys
//
//  Created by 罗耀生 on 15/1/9.
//
//

#include "TouchLayer.h"

USING_NS_CC;

TouchLayer::TouchLayer(){
    
    _bSwipe = false;
    _clicked = false;
}
TouchLayer::TouchLayer(bool Swipe){
    _bSwipe = Swipe;
}
TouchLayer::~TouchLayer(){
    
}

TouchLayer* TouchLayer::create(bool Swipe){
    
    TouchLayer *pRet = new TouchLayer( Swipe );
    if (pRet && pRet->init())
    {
        pRet->autorelease();
        return pRet;
    }
     CC_SAFE_DELETE( pRet );
    return nullptr;
}

bool TouchLayer::init(){
    
    if ( !LayerColor::init() ){
        return false;
    }
    
    this->addTouchEvent();
    
    return true;
}

void TouchLayer::appear(){
    
}
void TouchLayer::disappear(){
    
}

void TouchLayer::close(){
    
    _eventDispatcher->removeEventListener( _myListener );
}

void TouchLayer::addTouchEvent()
{
    _myListener = EventListenerTouchOneByOne::create();
    _myListener->setSwallowTouches( true );
    _myListener->onTouchBegan = [=](Touch* touch,Event* event)
    {
//        if ( this->getParent()->isVisible() != false)
//        {
//            Vec2 touchLocation = touch->getLocation();
//            Sprite *parent = dynamic_cast<Sprite*> (this->getParent() );
//
//            Vec2 local = parent->convertToNodeSpace(touchLocation);
//            Rect r = parent->rect();
//            r.origin = Vec2::ZERO;
//            
//            if ( r.containsPoint(local) )
//            {
//                return child;
//            }
//            
//            
//            return nullptr;
//        }

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
    _myListener->onTouchEnded = [=](Touch* touch,Event* event)
    {
        if ( !_bSwipe ) {
            this->autochthonous();
        }else{
            Point endTouch=touch->getLocation();
            Point delta = _startTouch - endTouch;
            if(abs(delta.x) > abs(delta.y))
            {
                //手势左右判断
                if(delta.x > 15)
                {
                    this->swipeLeft();
                }
                else if (delta.x < -15)
                {
                    this->swipeRight();
                }
            }
            else
            {
                //手势上下判断
                if(delta.y > 15)
                {
                    this->swipeDown();
                }
                else if (delta.y < -15)
                {
                    this->swipeUp();
                }
            }
        }
    };
    
    //注册监听
    auto dispatcher = Director::getInstance()->getEventDispatcher();
    dispatcher->addEventListenerWithFixedPriority( _myListener, 200);
}

void TouchLayer::onSingleCLick(float tt)
{
    if ( _clicked) {
        _clicked = false;
        onSingleCLick();
    }
}

void TouchLayer::swipeUp(){
    CCLOG("向上！");
}
void TouchLayer::swipeDown(){
    CCLOG("向下！");
}
void TouchLayer::swipeLeft(){
    CCLOG("向左！");
}
void TouchLayer::swipeRight(){
    CCLOG("向右！");
}

void TouchLayer::autochthonous(){
    CCLOG("非滑动！");
}

void TouchLayer::onSingleCLick()
{
    CCLOG("单击");
}
void TouchLayer::onDoubleClick()
{
    CCLOG("双击");
}
//void TouchLayer::onThreeClick()
//{
//    CCLOG("3连击");
//}
//void TouchLayer::onLongPressed();
//{
//    CCLOG("长按");
//}
