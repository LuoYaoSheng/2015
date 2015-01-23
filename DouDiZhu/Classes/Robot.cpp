//
//  Robot.cpp
//  CocosProject
//
//  Created by lys on 15/1/22.
//
//

#include "Robot.h"
#include "Logic.h"

static Robot* _shareInstance = nullptr;

Robot* Robot::getInstance()
{
    if( _shareInstance == nullptr)
    {
        _shareInstance = new Robot();
    }
    return _shareInstance;
}

Robot::Robot()
{
    mTrun = 0;
    for (int idx = 0; idx < 3; idx++) mUser[ idx ] = new User();
    this->init();
}
Robot::~Robot()
{
//    _shareInstance = nullptr;
}

bool Robot::init()
{
    mTrun = getTrun();
    
    unsigned char cards[ FULL_COUNT ];
    Logic::initCardList( cards, FULL_COUNT);
    Logic::RandCardList( cards, FULL_COUNT);
    for (int idx = 0; idx < 3; idx++)
    {
        mUser[ idx ]->setUserCards( &cards[idx * 17] );
    }
    for (int idx = 51; idx < 54; idx++) mThreeCards[idx-51] = cards[idx];
    
    return true;
}

int Robot::getMaxCallPoints()
{
    mMaxCallPoints = 0;
    for (int idx = 0; idx < 3; idx++) {
        mMaxCallPoints = mMaxCallPoints < mUser[ idx ]->mCallPoints ? mUser[ idx ]->mCallPoints : mMaxCallPoints;
    }
    return mMaxCallPoints;
}

int Robot::getLandlord()
{
    int landlord = -1;
    for (int idx = 0; idx < 3; idx++) {
        if ( 3 == mMaxCallPoints == mUser[ idx ]->mCallPoints ) {
            landlord = idx;
            mUser[ idx ]->mLandlord = true;
            break;
        }
        if ( mUser[ idx ]->mCallPoints == -1) {
            return -1;
        }
        if ( mMaxCallPoints == mUser[ idx ]->mCallPoints ) {
            landlord = idx;
            mUser[ idx ]->mLandlord = true;
            break;
        }
    }
    return landlord;
}

int Robot::getTrun()
{
    mTrun = mTrun == 3 ? 0 : mTrun++;
    return mTrun;
}