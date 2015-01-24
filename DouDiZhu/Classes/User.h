//
//  User.h
//  CocosProject
//
//  Created by 罗耀生 on 15/1/23.
//
//

#ifndef __CocosProject__User__
#define __CocosProject__User__

class User {
public:
    User();
    ~User();

    virtual bool init();
    virtual void setUserCards(unsigned char cards[], int count);
    virtual void sortCards();
    virtual void setCallPoints();
    virtual bool pullCards(unsigned char cards[], int cardCount);
public:
    unsigned char mPreCards[ 20 ];  //之前牌
    unsigned char mCurCards[ 20 ];  //当前牌
    bool mLandlord;
    int mCallPoints;
private:
    int _iLeft;
};

#endif /* defined(__CocosProject__User__) */
