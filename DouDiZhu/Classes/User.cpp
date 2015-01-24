//
//  User.cpp
//  CocosProject
//
//  Created by 罗耀生 on 15/1/23.
//
//

#include "User.h"
#include "Logic.h"
#include "cocos2d.h"

USING_NS_CC;

User::User()
{
    mLandlord = false;
    mCallPoints = -10;
}
User::~User()
{
    mLandlord = false;
    mCallPoints = -10;
    _iLeft = 0;
}
bool User::init()
{
    return true;
}

void User::setUserCards(unsigned char cards[] , int count)
{
    for (int idx = 0; idx < count; idx++) {
        mPreCards[ idx ] = -1;
        mCurCards[ idx ] = cards[ idx ];
    }
    for (int idx = count; idx < 20; idx++) {
        mPreCards[ idx ] = -1;
        mCurCards[ idx ] = -1;
    }
    _iLeft = count;
}

void User::sortCards()
{
    Logic::SortCardList( mCurCards, _iLeft);
}

void User::setCallPoints()
{
    mCallPoints = (int)(rand_0_1()*4);
}