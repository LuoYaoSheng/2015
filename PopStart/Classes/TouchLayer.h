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

// 有空参看这个-- 修改出后面几项 https://code.csdn.net/snippets/287571

class TouchLayer : public cocos2d::LayerColor {
public:
    virtual bool init();
    TouchLayer();
    TouchLayer(bool Swipe);
    ~TouchLayer();
    
    CREATE_FUNC( TouchLayer );
    static TouchLayer* create(bool Swipe);
    
    virtual void appear();
    virtual void disappear();
    virtual void close();
    
    virtual void addTouchEvent() final;
    virtual void swipeUp();
    virtual void swipeDown();
    virtual void swipeLeft();
    virtual void swipeRight();
    virtual void autochthonous();

    virtual void onSingleCLick();        //单击
    virtual void onDoubleClick();        //双击
//    virtual void onThreeClick();         //3连击
//    virtual void onLongPressed();        //长按
    
protected:
    void onSingleCLick(float tt);
    
protected:
    cocos2d::EventListenerTouchOneByOne *_myListener;
    cocos2d::Point _startTouch;
    bool _bSwipe;
    bool _clicked;
};


#endif /* defined(__lys__TouchLayer__) */
