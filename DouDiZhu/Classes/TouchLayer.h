//
//  TouchLayer.h
//  lys
//
//  Created by 罗耀生 on 15/1/9.
//
//

#ifndef __lys__TouchLayer__
#define __lys__TouchLayer__

#include "cocos2d.h"

class TouchLayerDelegate;

class TouchLayer : public cocos2d::LayerColor
{
public:
    virtual bool init();
    CREATE_FUNC( TouchLayer );
    TouchLayerDelegate *delegate;
    
protected:
    virtual void addTouchEvent() final;
    virtual void onSingleCLick();           //单击
    virtual void onDoubleClick();           //双击
    virtual void onMove(cocos2d::Point);    //移动
    
    virtual void onEnter();
    virtual void onExit();
    
    void onSingleCLick(float tt);
    
private:
    cocos2d::EventListenerTouchOneByOne *_myListener;
    cocos2d::Point _startTouch;
    bool _clicked;
    bool _isMoved;
};


class TouchLayerDelegate {
public:
    virtual void onSingleCLick(cocos2d::Vec2){};             //单击
    virtual void onDoubleClick(cocos2d::Vec2){};             //双击
    virtual void onMove(cocos2d::Vec2){};                    //移动
};

#endif /* defined(__lys__TouchLayer__) */
