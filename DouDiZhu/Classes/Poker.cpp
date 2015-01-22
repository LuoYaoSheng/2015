//
//  Poker.cpp
//  CocosProject
//
//  Created by lys on 15/1/22.
//
//

#include "Poker.h"

USING_NS_CC;

Poker::~Poker(){
    
}

bool Poker::init(){
    
    if ( !Node::init() ){
        return false;
    }
    
    _isSelect = false;
    
    return true;
}

Poker::Poker(const char* name)
{
    float gap = 10;
    
    _cardNor = Sprite::create( name );
    this->addChild( _cardNor , 1);
    _rect = Rect(0, 0, _cardNor->getContentSize().width+gap, _cardNor->getContentSize().height+gap );
    
//    _bgBottom = LayerColor::create(Color4B(122, 122, 122, 111), _rect.size.width+gap, _rect.size.height+gap);
    _bgBottom = LayerColor::create(Color4B::YELLOW, _rect.size.width+gap, _rect.size.height+gap);
    _bgBottom->setPosition( Vec2( -_rect.size.width*0.5, -_rect.size.height*0.5) );
    _bgBottom->setAnchorPoint( Vec2::ZERO );
    this->addChild( _bgBottom, 0);
    _bgBottom->setVisible( false );
}

Poker* Poker::createPoker(const char* name)
{
    Poker *pRet = new Poker( name );
    if (pRet && pRet->init())
    {
        pRet->autorelease();
        return pRet;
    }
    CC_SAFE_DELETE( pRet );
    return nullptr;
}

void Poker::setPosition(const cocos2d::Vec2 &position)
{
    Node::setPosition( position );

    _rect.origin = Vec2( position.x - _rect.size.width*0.5, position.y - _rect.size.height*0.5 );
}
void Poker::setSelect(bool select)
{
    if ( _isSelect != select) {
        _isSelect = select;
        _bgBottom->setVisible( select );
    }
}

bool Poker::getSelect()
{
    return _isSelect;
}

Size Poker::getContSize()
{
    return _rect.size;
}

