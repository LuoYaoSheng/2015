//
//  User.cpp
//  CocosProject
//
//  Created by 罗耀生 on 15/1/23.
//
//

#include "User.h"
#include "Logic.h"

User::User()
{
    mLandlord = false;
    mCallPoints = false;
}
User::~User()
{
    
}
bool User::init()
{
    return true;
}

void User::setUserCards(unsigned char cards[] )
{
    for (int idx = 0; idx < 17; idx++) {
        mPreCards[ idx ] = -1;
        mCurCards[ idx ] = cards[ idx ];
    }
    for (int idx = 17; idx < 20; idx++) {
        mPreCards[ idx ] = -1;
        mCurCards[ idx ] = -1;
    }
}

void User::sortCards()
{
    Logic::SortCardList( mCurCards, 17);
}