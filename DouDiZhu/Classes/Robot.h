//
//  Robot.h
//  CocosProject
//
//  Created by lys on 15/1/22.
//
//

#ifndef __CocosProject__Robot__
#define __CocosProject__Robot__

#include "User.h"

class Robot {
public:
    static Robot* getInstance();
    Robot();
    ~Robot();
    virtual bool init();
    virtual int getMaxCallPoints();
    virtual int getLandlord();
    
public:
    User *mUser[3];
    unsigned char mThreeCards[3];
    int mTrun;
    int mMaxCallPoints;
    
protected:
    int getTrun();
};

#endif /* defined(__CocosProject__Robot__) */
