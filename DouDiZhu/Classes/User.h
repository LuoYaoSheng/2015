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
    virtual void setUserCards(unsigned char cards[] );
    virtual void sortCards();
    virtual void setCallPoints();
public:
    unsigned char mPreCards[ 20 ];  //之前牌
    unsigned char mCurCards[ 20 ];  //当前牌
    bool mLandlord;
    int mCallPoints;
};

#endif /* defined(__CocosProject__User__) */
