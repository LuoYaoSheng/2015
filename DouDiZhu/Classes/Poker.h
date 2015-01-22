//
//  Poker.h
//  CocosProject
//
//  Created by lys on 15/1/22.
//
//

#ifndef __CocosProject__Poker__
#define __CocosProject__Poker__

#include "cocos2d.h"

class Poker : public cocos2d::Node
{
public:
    static Poker* createPoker(const char* name);
    
    virtual bool init();
    Poker(const char* name);
    ~Poker();

    virtual void setPosition(const cocos2d::Vec2 &position);
    virtual void setSelect(bool select);
    virtual bool getSelect();
    virtual void setUp(bool up);
    virtual bool getUp();
    virtual cocos2d::Size getContSize();
    
protected:
    cocos2d::Rect _rect;
    cocos2d::Vec2 _position;
    
    cocos2d::Sprite *_cardNor;
    cocos2d::LayerColor *_bgBottom;
//    cocos2d::Sprite *_cardDis;
    
private:
    bool _isSelect;
    bool _isUp;
    bool _isChange;
};

#endif /* defined(__CocosProject__Poker__) */
