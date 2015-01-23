//
//  Robot.cpp
//  CocosProject
//
//  Created by lys on 15/1/22.
//
//

#include "Robot.h"
#include "Logic.h"

static Robot* __shareInstance = NULL;

Robot* Robot::getInstance()
{
    if(!__shareInstance) __shareInstance = new Robot();
    return __shareInstance;
}

Robot::Robot()
{
    mTrun = -1;
    for (int idx = 0; idx < 3; idx++) mUser[ idx ] = new User();
    this->init();
}
Robot::~Robot()
{
    __shareInstance = nullptr;
}

bool Robot::init()
{
    mTrun = getTrun();
    
    unsigned char cards[ FULL_COUNT ];
    Logic::initCardList( cards, FULL_COUNT);
    Logic::RandCardList( cards, FULL_COUNT);
    for (int idx = 0; idx < 3; idx++) mUser[ idx ]->setUserCards( &cards[idx * 17] );
    for (int idx = 51; idx < 54; idx++) mThreeCards[idx-51] = cards[idx];
    
    return true;
}

int Robot::getTrun()
{
    mTrun = mTrun == 3 ? 0 : mTrun++;
    return mTrun;
}