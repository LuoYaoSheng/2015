//
//  TestSprite.cpp
//  lys
//
//  Created by 罗耀生 on 15/1/10.
//
//

#include "TestSprite.h"
#include "SpriteTouchLayer.h"
using namespace cocos2d;

TestSprite* TestSprite::create(const std::string& filename){
    TestSprite* ret = new TestSprite();
    if(ret && ret->initWithFile( filename ) ){
        ret->autorelease();
        return ret;
    }
    CC_SAFE_DELETE(ret);
    return nullptr;
}

bool TestSprite::initWithFile(const std::string& filename)
{
    if ( !Sprite::initWithFile( filename ) ){
        return false;
    }

    Rect rt = Rect( 0, 0, this->getContentSize().width, this->getContentSize().height);
    SpriteTouchLayer *layer = SpriteTouchLayer::create( rt );
    this->addChild( layer );
    
    return true;
}