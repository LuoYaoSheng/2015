//
//  LoginScene.h
//  MyGame
//
//  Created by lys on 15/1/21.
//
//

#ifndef __MyGame__LoginScene__
#define __MyGame__LoginScene__

#include "cocos2d.h"

class LoginScene : public cocos2d::Layer
{
public:
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::Scene* createScene();
    
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();
    
    // a selector callback
    void menuCloseCallback(cocos2d::Ref* pSender);
    
    // implement the "static create()" method manually
    CREATE_FUNC(LoginScene);
};

#endif /* defined(__MyGame__LoginScene__) */
