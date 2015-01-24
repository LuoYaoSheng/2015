//
//  SinglegameScene.cpp
//  CocosProject
//
//  Created by 罗耀生 on 15/1/20.
//
//

#include "SinglegameScene.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "LoginScene.h"
#include "WelcomeScene.h"
#include "Logic.h"

USING_NS_CC;

using namespace cocostudio::timeline;

enum{
    PBubble_start = 100,
    PBubble_net ,
    PBubble_noCall ,
    PBubble_one ,
    PBubble_two ,
    PBubble_three ,
    
    PBubble_check ,
    PBubble_reset ,
    PBubble_hint ,
    PBubble_pull ,
    
    PBubble_count,
};

enum{
    ToolBar_msg = 100,
    ToolBar_robot,
    ToolBar_set,
    ToolBar_back,
};

enum{
    PB_close = 100,
};

enum{
    PBM_net = 100,
    PBM_back ,
};


static bool dsc(const Poker *p1, Poker *p2)
{
    int v1 = Logic::GetCardLogicValue( p1->Value );
    int v2 = Logic::GetCardLogicValue( p2->Value );
    
    return v1 > v2;
}



Scene* SinglegameScene::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = SinglegameScene::create();
    
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool SinglegameScene::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }

    _robot = new Robot();
    _robot->init();
    
    auto rootNode = CSLoader::createNode("SinglegameScene.csb");
    addChild(rootNode);
    
    _Panel_Basic = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Basic"));
    _Panel_Basic_User[0] = static_cast<ui::Layout*>(_Panel_Basic->getChildByName("Panel_user_0"));
    _Panel_Basic_User[1] = static_cast<ui::Layout*>(_Panel_Basic->getChildByName("Panel_user_1"));
    _Panel_Basic_User[2] = static_cast<ui::Layout*>(_Panel_Basic->getChildByName("Panel_user_2"));
    
    _Toolbar = static_cast<ui::Layout*>(rootNode->getChildByName("Toolbar"));
    
    _Panel_Back = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Back"));
    _Panel_Back_Menu = static_cast<ui::Layout*>(_Panel_Back->getChildByName("Panel_Menu"));
    
    _Panel_Msg = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Msg"));
    _Panel_Msg_Menu = static_cast<ui::Layout*>(_Panel_Msg->getChildByName("Panel_Menu"));
    
    _Panel_Set = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Set"));
    _Panel_Set_Menu = static_cast<ui::Layout*>(_Panel_Set->getChildByName("Panel_Menu"));
    
    _Panel_Robot = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Robot"));
    _Panel_Robot_Menu = static_cast<ui::Layout*>(_Panel_Robot->getChildByName("Panel_Menu"));
    
    _Panel_Bubble = static_cast<ui::Layout*>(rootNode->getChildByName("Panel_Bubble"));
    
    
    //界面事件绑定
    this->Listener_PanelBaisc();
    this->Listener_Toolbar();
    this->Listener_PanelBack();
    this->Listener_PanelMsg();
    this->Listener_PanelSet();
    this->Listener_PanelRobot();
    this->Listener_PanelBubble();
    
    //添加手势层
    _touchLayer = TouchLayer::create();
    this->addChild( _touchLayer );
    _touchLayer->delegate = this;
    
    
    _bCanTouch = false;
    _itemp = 0;
    
    auto startItem = static_cast<ui::Button*>(_Panel_Bubble->getChildByName("BtnStart"));
    auto netItem = static_cast<ui::Button*>(_Panel_Bubble->getChildByName("BtnNet"));
    startItem->setVisible( true );
    netItem->setVisible( true );
    
    return true;
}

void SinglegameScene::onEnterTransitionDidFinish()
{
    Layer::onEnterTransitionDidFinish();
    
    _Toolbar->setPosition( Vec2( 162, 980) );
    MoveTo *to = MoveTo::create(0.6, Vec2(162, 678));
    _Toolbar->runAction( to );
}

#pragma mark - Listener
void SinglegameScene::Listener_PanelBaisc()
{
    for (int idx = 0; idx < 3; idx++) {
        
        auto panel = static_cast<ui::Button*>( _Panel_Basic_User[idx]->getChildByName("Panel_Head") );
        auto item = static_cast<ui::Button*>( panel->getChildByName("BtnHead") );
        
        item->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelBasicPanelUserCallback, this));
    }
}
void SinglegameScene::Listener_Toolbar()
{
    for (int idx = ToolBar_msg; idx <= ToolBar_back; idx++) {
        auto item = static_cast<ui::Button*>(_Toolbar->getChildByTag( idx ) );
        item->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::ToolbarCallback, this));
    }
}
void SinglegameScene::Listener_PanelBack()
{
    auto closeItem = static_cast<ui::Button*>(_Panel_Back->getChildByName("BtnClose"));
    closeItem->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelBackCallback, this));
    
    for (int idx = PBM_net; idx <= PBM_back; idx++) {
        auto item = static_cast<ui::Button*>(_Panel_Back_Menu->getChildByTag( idx ) );
        item->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelBackPanelMenuCallback, this));
    }
}
void SinglegameScene::Listener_PanelMsg()
{
    auto closeItem = static_cast<ui::Button*>(_Panel_Msg->getChildByName("BtnClose"));
    closeItem->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelMsgCallback, this));
}
void SinglegameScene::Listener_PanelSet()
{
    auto closeItem = static_cast<ui::Button*>(_Panel_Set->getChildByName("BtnClose"));
    closeItem->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelSetCallback, this));
}
void SinglegameScene::Listener_PanelRobot()
{
    auto closeItem = static_cast<ui::Button*>(_Panel_Robot->getChildByName("BtnClose"));
    closeItem->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelRobotCallback, this));
}

void SinglegameScene::Listener_PanelBubble()
{
    for (int idx = PBubble_start; idx < PBubble_count; idx++) {
        auto item = static_cast<ui::Button*>(_Panel_Bubble->getChildByTag( idx ) );
        item->addTouchEventListener(CC_CALLBACK_2(SinglegameScene::PanelBubbleCallback, this));
        item->setVisible(false);
    }
}

#pragma mark - btn action
void SinglegameScene::PanelBasicCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{

}
void SinglegameScene::PanelBasicPanelUserCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    
}
void SinglegameScene::menuCloseCallback(Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
    }
}

void SinglegameScene::ToolbarCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
        ui::Button* btn = static_cast<ui::Button*>(pSender);
        switch ( btn->getTag() ) {
            case ToolBar_msg:
            {
//                _Panel_Msg->setVisible( true );
                auto scene = SinglegameScene::createScene();
                Director::getInstance()->runWithScene( scene );
            }
                break;
            case ToolBar_robot:
            {
                _Panel_Robot->setVisible( true );
            }
                break;
            case ToolBar_set:
            {
                _Panel_Set->setVisible( true );
            }
                break;
                
            default:
            {
                _Panel_Back->setVisible( true );
            }
                break;
        }
    }
}
void SinglegameScene::PanelBackCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) _Panel_Back->setVisible(false);
}
void SinglegameScene::PanelBackPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
        ui::Button* btn = static_cast<ui::Button*>(pSender);
        switch ( btn->getTag() ) {
            case PBM_net:
            {
                auto scene = LoginScene::createScene();
                //                Director::getInstance()->runWithScene( scene );
                Director::getInstance()->pushScene( scene );
            }
                break;
            default:
            {
                auto scene = WelcomeScene::createScene();
                Director::getInstance()->runWithScene( scene );
            }
                break;
        }
    }
    
}
void SinglegameScene::PanelMsgCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) _Panel_Msg->setVisible(false);
}
void SinglegameScene::PanelMsgPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    
}
void SinglegameScene::PanelSetCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) _Panel_Set->setVisible(false);
}
void SinglegameScene::PanelSetPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    
}
void SinglegameScene::PanelRobotCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) _Panel_Robot->setVisible(false);
}
void SinglegameScene::PanelRobotPanelMenuCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    
}
void SinglegameScene::PanelBubbleCallback(cocos2d::Ref* pSender, Widget::TouchEventType type)
{
    if ( cocos2d::ui::Widget::TouchEventType::ENDED == type) {
        ui::Button* btn = static_cast<ui::Button*>(pSender);
        switch ( btn->getTag() ) {
            case PBubble_start:
            {
                this->UI_update_basic( true );
            }
                break;
                case PBubble_net:
            {
                auto scene = LoginScene::createScene();
                Director::getInstance()->runWithScene( scene );
            }
                break;
                
            case PBubble_noCall:
            case PBubble_one:
            case PBubble_two:
            case PBubble_three:
            {
                _robot->mUser[2]->mCallPoints = btn->getTag() - PBubble_noCall;
                this->trunCallback( _itemp );
            }
                break;
                
            default:
            {
                CCLOG("--------");
            }
                break;
        }
    }
}
#pragma mark - ui update
void SinglegameScene::UI_update_basic(bool isStart)
{
    //等robot洗牌
    //=========
    
    //提示按钮去除
    auto startItem = static_cast<ui::Button*>(_Panel_Bubble->getChildByName("BtnStart"));
    auto netItem = static_cast<ui::Button*>(_Panel_Bubble->getChildByName("BtnNet"));
    startItem->setVisible( false );
    netItem->setVisible( false );
    
    //ok去除
    for (int idx = 0; idx < 3; idx++) {
        auto item = static_cast<ui::ImageView*>(_Panel_Basic_User[ idx ]->getChildByName("ok"));
        item->setVisible( !isStart );
    }
    
    //添加非自己的牌和分数
    for (int idx = 0; idx < 2; idx++) {
        auto item0 = static_cast<ui::ImageView*>(_Panel_Basic_User[ idx ]->getChildByName("score"));
        item0->setVisible( !isStart );
        auto item1 = static_cast<ui::ImageView*>(_Panel_Basic_User[ idx ]->getChildByName("pork"));
        item1->setVisible( isStart );
        auto item2 = static_cast<ui::ImageView*>(_Panel_Basic_User[ idx ]->getChildByName("pokerNum"));
        item2->setVisible( isStart );
    }
    
    //自己去除头像外的数据
    auto item0 = static_cast<ui::ImageView*>(_Panel_Basic_User[ 2 ]->getChildByName("score"));
    item0->setVisible( !isStart );
    auto item1 = static_cast<ui::ImageView*>(_Panel_Basic_User[ 2 ]->getChildByName("pork"));
    item1->setVisible( !isStart );
    auto item2 = static_cast<ui::ImageView*>(_Panel_Basic_User[ 2 ]->getChildByName("pokerNum"));
    item2->setVisible( !isStart );
    auto item3 = static_cast<ui::ImageView*>(_Panel_Basic_User[ 2 ]->getChildByName("name"));
    item3->setVisible( !isStart );
    auto item4 = static_cast<ui::ImageView*>(_Panel_Basic_User[ 2 ]->getChildByName("level"));
    item4->setVisible( !isStart );
    
    auto action = MoveTo::create(0.4, Vec2(-150, 150 ));
    _Panel_Basic_User[ 2 ]->runAction( action );
    

    //初始化处理~~~

    float dt = 0.23;
    //播放发牌动画
    for (int idx = 0; idx < 52; idx++) {
        
        switch ( idx%3 ) {
            case 0:
            {
                if ( idx%9 == 0) {
                    Sprite *poker = Sprite::create( "imgs/poker/cover_big.png" );
                    poker->setPosition( Vec2(512,434) );
                    this->addChild( poker );
                    poker->setScale( 0.8 );
                    
                    auto to = MoveTo::create( dt, Vec2( 80, 630) );
                    auto scale = ScaleTo::create( dt, 1);
                    auto fadeout = FadeOut::create( dt );
                    auto sp = Spawn::create(to,scale,fadeout,NULL);
                    auto callFuncAction = CallFuncN::create( CC_CALLBACK_1(SinglegameScene::delCallback, this) );
                    auto delay = DelayTime::create( dt* (idx/3) );
                    auto sqe = Sequence::create( delay, sp, callFuncAction, NULL);
                    poker->runAction( sqe );
                }
            }
                break;
            case 1:
            {
                if ( idx%9 == 1) {
                    Sprite *poker = Sprite::create( "imgs/poker/cover_big.png" );
                    poker->setPosition( Vec2(512,434) );
                    this->addChild( poker );
                    poker->setScale( 0.8 );
                    
                    auto to = MoveTo::create( dt, Vec2( 900, 630) );
                    auto scale = ScaleTo::create( dt, 1);
                    auto fadeout = FadeOut::create( dt );
                    auto sp = Spawn::create(to,scale,fadeout,NULL);
                    auto callFuncAction = CallFuncN::create( CC_CALLBACK_1(SinglegameScene::delCallback, this) );
                    auto delay = DelayTime::create( dt* (idx/3) + 0.2 );
                    auto sqe = Sequence::create( delay, sp, callFuncAction, NULL);
                    poker->runAction( sqe );
                }
            }
                break;
            default:
            {
                int value = _robot->mUser[ 2 ]->mCurCards[ idx/3 ];
                Poker *poker = Poker::createPoker( StringUtils::format("PokerPlist/poker%d.png", value ).c_str()  );
                poker->setTag( idx/3 );
                poker->Value = value;

                //                Sprite *poker = Sprite::create( "imgs/poker/cover_big.png" );
                poker->setPosition( Vec2(512,434) );
                this->addChild( poker );
                poker->setScale( 0.8 );
                poker->setVisible(false);
                
                auto to = MoveTo::create( dt, Vec2( 125.00 + 48* (idx/3), 120.00 ) );
                auto scale = ScaleTo::create( dt, 1);
                //                auto fadeout = FadeOut::create( dt );
                auto sp = Spawn::create(to,scale,NULL);
                auto callFuncAction = CallFuncN::create( CC_CALLBACK_1(SinglegameScene::showCallback, this) );
                auto delay = DelayTime::create( dt* (idx/3) + 0.2 );
                
                auto sqe = Sequence::create( delay,callFuncAction, sp, NULL);
                poker->runAction( sqe );
                
                _vector.pushBack( poker );
            }
                break;
        }
    }
    

    auto delay = DelayTime::create( dt + 0.2 * 20 );
    auto callFuncAction = CallFuncN::create( CC_CALLBACK_1(SinglegameScene::settleCallback, this) );
    auto sqe = Sequence::create( delay,callFuncAction,  NULL);
    this->runAction( sqe );
    
    //牌型
    auto delay1 = DelayTime::create( dt + 0.2 * 20 + 0.6 );
    auto callFuncAction1 = CallFuncN::create( CC_CALLBACK_1(SinglegameScene::publicCallback, this) );
    auto sqe1 = Sequence::create( delay1, callFuncAction1,  NULL);
    this->runAction( sqe1 );
}

#pragma mark - del callback
void SinglegameScene::delCallback(Node* node)
{
    node->removeFromParentAndCleanup(true);
}
void SinglegameScene::showCallback(Node* node)
{
    node->setVisible( true );
}
void SinglegameScene::settleCallback(Node* node)
{
    _robot->mUser[2]->sortCards();

    Size size = Director::getInstance()->getWinSize();
    for (auto sp : _vector) {
        
        Vec2 pt = sp->getPosition();
        
        auto to1 = MoveTo::create(0.3, Vec2(size.width*0.5, size.height*0.5));
        auto callFuncAction = CallFuncN::create( CC_CALLBACK_1(SinglegameScene::alertCallback, this) );
        auto to2 = MoveTo::create(0.3, pt);
        auto sqe = Sequence::create( to1, callFuncAction, to2, NULL);
        sp->runAction( sqe );
    }
}

void SinglegameScene::publicCallback(Node* node)
{
    Size size = Director::getInstance()->getWinSize();
    
    float gap = 80;
    float oX = size.width*0.5 - gap;

    for (int idx = 51; idx < 54; idx++) {
        _threeCards[idx-51] = Sprite::create( "imgs/poker/cover_big.png" );
        _threeCards[idx-51]->setPosition( Vec2( oX + (idx-51)*gap, size.height*0.5+100 ) );
        this->addChild( _threeCards[idx-51] );
    }
    
    this->trunCallback( _robot->mTrun );
}

void SinglegameScene::smallCallback(Node* node)
{
    
}


void SinglegameScene::alertCallback(Node* node)
{
    unsigned char *cards = _robot->mUser[2]->mCurCards;
    
    Poker *sp = (Poker *)node;
    sp->updateImg( StringUtils::format("PokerPlist/poker%d.png", cards[ sp->getTag() ] ).c_str() );
    sp->Value = cards[ sp->getTag() ];
}

void  SinglegameScene::oneUpdate(float dt)
{
    this->trunCallback( _itemp );
}

void SinglegameScene::trunCallback(int trun)
{
    int iMax = _robot->getMaxCallPoints();
    int iLandlord = _robot->getLandlord();
    
    if ( iLandlord >= 0 ) {

        _robot->mTrun = iLandlord; //重置用户操作顺序

        auto Panel_Head = static_cast<ui::Layout*>( _Panel_Basic_User[ iLandlord ]->getChildByName("Panel_Head") );
        auto BtnHead = static_cast<ui::Button*>( Panel_Head->getChildByName("BtnHead") );
        auto sp = Sprite::create( "imgs/portrait/imgPortraitLandlord.png"  );
        auto head = static_cast<Sprite*>( BtnHead->getChildByName("head") );
        head->removeFromParent();
        sp->setPosition( head->getPosition() );
        sp->setName("head");
        BtnHead->addChild( sp );
        
        auto yellow = static_cast<ui::Layout*>( Panel_Head->getChildByName("Yellow") );
        yellow->setVisible( true );
        auto bllink = Blink::create( 1, 1);
        auto repeate = Repeat::create(bllink, 10000);
        yellow->stopAllActions();
        yellow->runAction( repeate );
    
        
        for (int idx = PBubble_noCall; idx < PBubble_count; idx++) {
            auto item = static_cast<ui::Button*>(_Panel_Bubble->getChildByTag( idx ) );
            item->setVisible( false );
        }
        
        for (int idx = 0; idx < 3; idx++) {
            
            Sprite *sp = Sprite::create( StringUtils::format("PokerPlist/poker%d.png", _robot->mThreeCards[ idx ]  ).c_str() );
            _threeCards[ idx ]->setTexture( sp->getTexture() ) ;
            
            auto delay = DelayTime::create( 0.5 );
            auto to = MoveTo::create( 0.3, Vec2(446+idx*47, 730) );
            auto scale = ScaleTo::create( 0.3, 0.3);
            auto fadeIn = FadeIn::create( 0.4 );
            auto que = Spawn::create( to ,scale, fadeIn, NULL);
            auto callFuncAction = CallFuncN::create( CC_CALLBACK_1(SinglegameScene::smallCallback, this) );
            auto sqe = Sequence::create( delay, que, callFuncAction,  NULL);
            _threeCards[ idx ]->runAction( sqe );
        }
        
        if ( _robot->mUser[2]->mLandlord ) {
            unsigned char *cards = _robot->mUser[2]->mCurCards;
            for (int idx = 0; idx < 3; idx++) {
                cards[17+idx] = _robot->mThreeCards[ idx ];
                int value = _robot->mThreeCards[ idx ];
                Poker *poker = Poker::createPoker( StringUtils::format("PokerPlist/poker%d.png", value ).c_str()  );
                poker->setTag( idx+17 );
                poker->Value = value;
                this->addChild( poker );
                _vector.pushBack( poker );
            }
            _robot->mUser[2]->setUserCards( cards, 20);
            _robot->mUser[2]->sortCards();
            
            std::sort( _vector.begin(), _vector.end(), dsc);
            for (int idx = 0; idx < 20; idx++) {
                
                auto sp = _vector.at( idx );
                sp->setPosition( Vec2( 77 + 46* idx, 120.00 ) );
                sp->setZOrder( idx );
                
                if ( sp->Value == _robot->mThreeCards[0] || sp->Value == _robot->mThreeCards[1] || sp->Value == _robot->mThreeCards[2]) {

                    Vec2 pt = sp->getPosition();
                    sp->setPosition( Vec2( pt.x, pt.y + 30 ) );

                    auto jump = JumpTo::create(0.4, pt, 60, 1);
                    sp->runAction( jump );
                }
            }
        }else{
            
        }

        for (int idx = 0; idx < 3; idx++) {
            ui::Layout* Panel_bubble = static_cast<ui::Layout*>(  _Panel_Basic_User[ idx ]->getChildByName("Panel_bubble") );
            Panel_bubble->setVisible( true );
            
            ui::Layout* Panel_bubble_short = static_cast<ui::Layout*>(  Panel_bubble->getChildByName("Panel_bubble_short") );
            Panel_bubble_short->setVisible( false );
            
            auto noCall = static_cast<Sprite*>(  Panel_bubble_short->getChildByName("NoCall") );
            auto num = static_cast<Sprite*>(  Panel_bubble_short->getChildByName("Num") );
            auto score = static_cast<Sprite*>(  Panel_bubble_short->getChildByName("Score") );

            noCall->setVisible( false );
            num->setVisible( false );
            score->setVisible( false );
        }

        //出牌操作
        auto check = static_cast<ui::Button*>(  _Panel_Bubble->getChildByName("BtnCheck") );
        auto reset = static_cast<ui::Button*>(  _Panel_Bubble->getChildByName("BtnReset") );
        auto hint = static_cast<ui::Button*>(  _Panel_Bubble->getChildByName("BtnHint") );
        auto pull = static_cast<ui::Button*>(  _Panel_Bubble->getChildByName("BtnPull") );
        
        check->setVisible( true );
        reset->setVisible( true );
        hint->setVisible( true );
        pull->setVisible( true );
        
        reset->setBright(false);
        reset->setTouchEnabled(false);
        pull->setBright(false);
        pull->setTouchEnabled(false);

        _bCanTouch = true;
  
    }else{
        int iTrum = trun > 2 ? 0:trun;
        if ( iTrum == 2) {
            
            for (int idx = PBubble_noCall; idx < PBubble_check; idx++) {
                auto item = static_cast<ui::Button*>(_Panel_Bubble->getChildByTag( idx ) );
                item->setVisible( true );
                
                if ( idx != PBubble_noCall) {
                    int index = idx - PBubble_noCall;
                    if ( index <= iMax) {
                        item->setBright(false);
                        item->setTouchEnabled(false);
                    }
                }
            }
        }else{
            
            ui::Layout* Panel_bubble = static_cast<ui::Layout*>(  _Panel_Basic_User[ iTrum ]->getChildByName("Panel_bubble") );
            Panel_bubble->setVisible( true );
            
            ui::Layout* Panel_bubble_short = static_cast<ui::Layout*>(  Panel_bubble->getChildByName("Panel_bubble_short") );
            
            auto noCall = static_cast<Sprite*>(  Panel_bubble_short->getChildByName("NoCall") );
            auto num = static_cast<Sprite*>(  Panel_bubble_short->getChildByName("Num") );
            auto score = static_cast<Sprite*>(  Panel_bubble_short->getChildByName("Score") );
            
            
            bool isEt = false;
            int callPoints ;
            while ( !isEt ) {
                callPoints = _robot->mUser[ iTrum ]->mCallPoints;
                for (int idx = 0; idx < 3; idx++) {
                    if ( idx == iTrum) continue;
                    isEt = true;
                    if ( callPoints <= 0 && callPoints == _robot->mUser[ idx ]->mCallPoints ) {
                        isEt = false;
                        _robot->mUser[ iTrum ]->setCallPoints();
                        break;
                    }
                }
            }

            if ( callPoints == 0 ) {
                noCall->setVisible( true );
            }else{
                num->setVisible( true );
                score->setVisible( true );
                
                Sprite * temp_obj = Sprite::create( StringUtils::format("imgs/bubble/bubble_num_%d.png", callPoints ).c_str() );
                num->setTexture( temp_obj->getTexture() );
            }
            
            _itemp = trun + 1;
            if ( callPoints == 3 || _itemp == 2) {
                this->trunCallback( _itemp );
            }else{
                this->scheduleOnce(schedule_selector(SinglegameScene::oneUpdate), 1.0f);
            }
        }
    }
}

#pragma mark - TouchLayer delegate
void SinglegameScene::onSingleCLick(cocos2d::Vec2 pt)
{
    if ( !_bCanTouch ) return;
    
    for (int idx = _vector.size()-1; idx >= 0; idx--) {
        auto sp = _vector.at( idx );
        Rect rt ;
        rt.size = sp->getContSize();
        rt.origin = this->convertToNodeSpace( Vec2( sp->getPosition().x - rt.size.width*0.5, sp->getPosition().y - rt.size.height*0.5) );
        Vec2 local = this->convertToNodeSpace( pt );
        
        if ( rt.containsPoint( local ) )
        {
            sp->setSelect( true );
            break;
        }
    }
    
}
void SinglegameScene::onDoubleClick(cocos2d::Vec2 pt)
{
    if ( !_bCanTouch ) return;
    CCLOG("双击");
}
void SinglegameScene::onMove(cocos2d::Vec2 pt)
{
    if ( !_bCanTouch ) return;
    for( auto sp : _vector)
    {
        Rect rt ;
        rt.size = sp->getContSize();
        rt.origin = this->convertToNodeSpace( Vec2( sp->getPosition().x - rt.size.width*0.5, sp->getPosition().y - rt.size.height*0.5) );
        Vec2 local = this->convertToNodeSpace( pt );
        
        if ( rt.containsPoint( local ) )
            
            if ( !sp->getSelect() ) {
                sp->setSelect( true );
            }
        break;
    }
    
    for (int idx = _vector.size()-1; idx >= 0; idx--) {
        auto sp = _vector.at( idx );
        Rect rt ;
        rt.size = sp->getContSize();
        rt.origin = this->convertToNodeSpace( Vec2( sp->getPosition().x - rt.size.width*0.5, sp->getPosition().y - rt.size.height*0.5) );
        Vec2 local = this->convertToNodeSpace( pt );
        
        if ( rt.containsPoint( local ) )
        {
            if ( !sp->getSelect() ) {
                sp->setSelect( true );
            }
            break;
        }
    }
}

void SinglegameScene::onLongPressed(cocos2d::Vec2)
{
    if ( !_bCanTouch ) return;
}
void SinglegameScene::onTouchEnd()
{
    if ( !_bCanTouch ) return;
    for (int idx = _vector.size()-1; idx >= 0; idx--) {
        auto sp = _vector.at( idx );
        
        if ( sp->getSelect() ) {
            sp->setSelect( false );
            sp->setUp( !sp->getUp() );
        }
    }
}
