//
//  Start.cpp
//  lys
//
//  Created by 罗耀生 on 15/1/9.
//
//

#include "Start.h"
using namespace cocos2d;

Star* Star::create(int color){
    Star* ret = new Star();
    if(ret && ret->initWithFile(ret->getImage(color))){
        ret->_color = color;
        ret->_selected = false;
        ret->autorelease();
        return ret;
    }
    CC_SAFE_DELETE(ret);
    return nullptr;
}

const char* Star::getImage(int color){
    switch(color){
        case color::BLUE:
            return "blue.png";
        case color::GREEN:
            return "green.png";
        case color::YELLOW:
            return "orange.png";
        case color::RED:
            return "red.png";
//        case color::PURPLE:
        default:
            return "purple.png";
    }
}

bool Star::isSelected(){
    return _selected;
}

int Star::getColor(){
    return _color;
}

void Star::setDesPosition(const Point& p){
    desPosition = p;
}

void Star::updatePosition(){
    if(desPosition.y != getPositionY()){
        setPositionY(getPositionY() - MOVE_SPEED);
        if(getPositionY() < desPosition.y){
            setPositionY(desPosition.y);
        }
    }
    if(desPosition.x != getPositionX()){
        setPositionX(getPositionX() - MOVE_SPEED);
        if(getPositionX() < desPosition.x){
            setPositionX(desPosition.x);
        }
    }
}