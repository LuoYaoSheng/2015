//
//  SpriteTouchLayer.h
//  lys
//
//  Created by 罗耀生 on 15/1/10.
//
//

#ifndef __lys__SpriteTouchLayer__
#define __lys__SpriteTouchLayer__

class SpriteTouchLayer : public cocos2d::LayerColor {
public:
    virtual bool init();
    SpriteTouchLayer();
    ~SpriteTouchLayer();
    
    CREATE_FUNC( SpriteTouchLayer );
    static SpriteTouchLayer* create(cocos2d::Rect rt);

    virtual void addTouchEvent() final;
    virtual void onSingleCLick();        //单击
    virtual void onDoubleClick();        //双击
    
    virtual void onEnter();
    virtual void onExit();
    
protected:
    void onSingleCLick(float tt);
    
protected:
    cocos2d::EventListenerTouchOneByOne *_myListener;
    cocos2d::Point _startTouch;
    bool _clicked;
    cocos2d::Rect _rect;
};

#endif /* defined(__lys__SpriteTouchLayer__) */
