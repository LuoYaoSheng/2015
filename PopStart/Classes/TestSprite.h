//
//  TestSprite.h
//  lys
//
//  Created by 罗耀生 on 15/1/10.
//
//

#ifndef __lys__TestSprite__
#define __lys__TestSprite__

#include "cocos2d.h"

class TestSprite : public cocos2d::Sprite
{
public:
    static TestSprite* create(const std::string& filename);
    virtual bool initWithFile(const std::string& filename);
};

#endif /* defined(__lys__TestSprite__) */
