#include "WatchOutScene.h"
#include "SimpleAudioEngine.h"

USING_NS_CC;
using namespace CocosDenshion;

Scene* WatchOut::createScene() {
    auto scene = Scene::create();
    
    auto layer = WatchOut::create();

    scene->addChild(layer);

    return scene;
}

bool WatchOut::init() {
	if ( !Layer::init() )
    {
        return false;
    }
	//ÃÌº”plistµΩª∫≥Â≥ÿ
	SpriteFrameCache::getInstance()->addSpriteFramesWithFile("watchout.plist", "watchout.png");
	//‘§º”‘ÿ“Ù–ßŒƒº˛
	preloadMusic();
	//≥ı ºªØView
	setupView();
	return true;
}

void WatchOut::setupView() {
	//¥∞ø⁄¥Û–°
	Size winSize = Director::getInstance()->getVisibleSize();

	//∞—¥∞ø⁄∑÷Œ™5µ»∑›
	float winSize_5 = winSize.height / 5;
	/*
	…œ≤ø∑÷’º3∑›
	-1£∫∫⁄œﬂ’º1œÒÀÿ
	*/
	float bgTopHeight = (winSize_5 * 3) - 1;
	//œ¬≤ø∑÷’º2µ»∑›
	float bgBottomHeight =  winSize_5 * 2;
	//∂•≤ø—’…´
	auto bgTop = LayerColor::create(color_default, winSize.width, bgTopHeight);
	bgTop->setPosition(Vec2(0, bgBottomHeight + 1));
	bgTop->setTag(tag_bg_top);
	bgTop->setAnchorPoint(Vec2::ZERO);
	this->addChild(bgTop, 1);
	//÷–º‰∫⁄…´Ãı
	auto lineMiddle = LayerColor::create(Color4B::BLACK, winSize.width, 1);
	lineMiddle->setPosition(Vec2(0, bgBottomHeight));
	this->addChild(lineMiddle, 0);
	//µ◊≤ø—’…´
	auto bgBottom = LayerColor::create(color_default_b, winSize.width, bgBottomHeight);
	bgBottom->setPosition(Vec2::ZERO);
	bgBottom->setAnchorPoint(Vec2::ZERO);
	bgBottom->setTag(tag_bg_bottom);
	this->addChild(bgBottom, 0);

	auto cache = SpriteFrameCache::getInstance();
	//µ√∑÷±≥æ∞
	auto scoreBg = Sprite::createWithSpriteFrame(cache->getSpriteFrameByName("score_bg.png"));
	scoreBg->setPosition(Vec2(bgTop->getContentSize().width / 2, bgTop->getPositionY() + bgTop->getContentSize().height / 2));
	scoreBg->setScale(0.6, 0.6);
	scoreBg->setAnchorPoint(Vec2::ANCHOR_MIDDLE_BOTTOM);
	scoreBg->setTag(tag_score_bg);
	this->addChild(scoreBg, 1);
	//µ√∑÷Label
	auto label = LabelTTF::create("0", "Arial", 100);
	label->setPosition(Vec2(scoreBg->getContentSize().width / 2, scoreBg->getContentSize().height / 2));
	label->setColor(color_default_cc3);
	label->setTag(tag_score_label);
	scoreBg->addChild(label);

	//ø™ º”Œœ∑∞¥≈•
	auto startMenuItem = MenuItemImage::create();
	startMenuItem->setNormalSpriteFrame(cache->getSpriteFrameByName("start_game.png"));
	startMenuItem->setSelectedSpriteFrame(cache->getSpriteFrameByName("start_game.png"));
	startMenuItem->setPosition(Vec2(bgBottom->getContentSize().width / 2, bgBottom->getContentSize().height / 2));
	startMenuItem->setCallback(CC_CALLBACK_1(WatchOut::startGame, this));
	startMenuItem->setScale(0.8, 0.8);
	auto menu = Menu::create(startMenuItem, NULL);
    menu->setPosition(Vec2::ZERO);
	menu->setTag(tag_start_game);
    this->addChild(menu, 2);

	//◊Û±ﬂ‘≤‘≤
	auto yuanyuan = Sprite::createWithSpriteFrame(cache->getSpriteFrameByName("yuanyuan.png"));
	yuanyuan->setPosition(Vec2(2, 2));
	yuanyuan->setAnchorPoint(Vec2::ZERO);
	yuanyuan->setTag(tag_yuanyuan);
	yuanyuan->setVisible(false);
	bgTop->addChild(yuanyuan);
	//”“±ﬂ∑Ω∑Ω
	auto fangfang = Sprite::createWithSpriteFrame(cache->getSpriteFrameByName("fangfang.png"));
	fangfang->setPosition(Vec2(winSize.width - fangfang->getContentSize().width - 2, 2));
	fangfang->setAnchorPoint(Vec2::ZERO);
	fangfang->setTag(tag_fangfang);
	fangfang->setVisible(false);
	bgTop->addChild(fangfang);

	//≥ı ºªØÃ¯‘æ∏ﬂ∂»
	_jumpHeight =  yuanyuan->getContentSize().height * 0.9;
	//≥ı ºªØ”Œœ∑◊¥Ã¨
	_gameState = GAME_STATE_START;
	//≥ı ºªØ”Œœ∑ø™ ºÀŸ∂»£®∑Ω∑Ω/‘≤‘≤≈‹µƒÀŸ∂»£©
	_runSpeed = 2.0f;
	//≥ı ºªØ∑÷ ˝
	_score = 0;

	//ø™∆Ù√ø÷°µ˜”√
	scheduleUpdate();

	//ÃÌº”∆¡ƒª¥•√˛ ¬º˛
	auto dispatcher = Director::getInstance()->getEventDispatcher();
	auto listener = EventListenerTouchOneByOne::create();
	listener->onTouchBegan = CC_CALLBACK_2(WatchOut::onTouchBegan, this);
	dispatcher->addEventListenerWithSceneGraphPriority(listener, this);
}

void WatchOut::startGame(Ref* pSender) {
	//≤•∑≈“Ù–ß
	SimpleAudioEngine::getInstance()->playEffect(music_button_touch);

	//ªÒµ√∂•≤ø±≥æ∞
	auto top = this->getChildByTag(tag_bg_top);
	//ªÒµ√∑Ω∑Ω/‘≤‘≤
	Sprite* yuanyuan = (Sprite*)top->getChildByTag(tag_yuanyuan);
	Sprite* fangfang = (Sprite*)top->getChildByTag(tag_fangfang);

	/* ÷ÿ÷√≤Œ ˝ */
	_runSpeed = 2.0f;
	_score = 0;
	auto scoreBg = this->getChildByTag(tag_score_bg);
	//∑÷ ˝Label
	LabelTTF* scoreLabel = (LabelTTF*)scoreBg->getChildByTag(tag_score_label);
	scoreLabel->setString(StringUtils::format("%i", 0));
	//∂•≤ø—’…´
	LayerColor* topBg = (LayerColor*)this->getChildByTag(tag_bg_top);
	//µ◊≤ø—’…´
	LayerColor* bottomBg = (LayerColor*)this->getChildByTag(tag_bg_bottom);
	topBg->setColor(ccc3(205, 225, 235));
	bottomBg->setColor(ccc3(63, 88, 100));
	scoreLabel->setColor(color_default_cc3);

	//∑Ω∑Ω/‘≤‘≤÷ÿ÷√
	resetRunner();
	
	auto startGame = this->getChildByTag(tag_start_game);
	//“˛≤ÿ[ø™ º”Œœ∑]∞¥≈•
	startGame->setVisible(false);
}

void WatchOut::update(float dt) {
	auto top = this->getChildByTag(tag_bg_top);
	Sprite* yuanyuan = (Sprite*)top->getChildByTag(tag_yuanyuan);
	Sprite* fangfang = (Sprite*)top->getChildByTag(tag_fangfang);

	if(_gameState == GAME_STATE_PLAYING) {
		//“∆∂Ø∑Ω∑Ω/‘≤‘≤
		yuanyuan->setPositionX(yuanyuan->getPositionX() + _runSpeed);
		fangfang->setPositionX(fangfang->getPositionX() - _runSpeed);

		auto yyBox = yuanyuan->getBoundingBox();
		auto ffBox = fangfang->getBoundingBox();

		//碰撞检测
		if(yyBox.intersectsRect(ffBox)) {
			_gameState = GAME_STATE_OVER;
			SimpleAudioEngine::getInstance()->playEffect(music_player_die);
			auto startGame = this->getChildByTag(tag_start_game);
			startGame->setVisible(true);

			/* 爆炸效果 */
			auto pExpVec = Vec2::ZERO;
			auto pExpColor = Color4F::BLUE;
			auto pExpTextureRect = Rect::ZERO;
			//根据当前tag决定爆炸对象
			if(_currentTag == yuanyuan->getTag()) {
				yuanyuan->setVisible(false);
				pExpVec = Vec2(
					yuanyuan->getPositionX() + yuanyuan->getContentSize().width / 4,
					yuanyuan->getPositionY() + yuanyuan->getContentSize().height / 4);
				pExpColor = Color4F(225, 26, 19, 255);
				pExpTextureRect = Rect(24,491,9,9);
			}else {
				fangfang->setVisible(false);
				pExpVec = Vec2(
					fangfang->getPositionX() + fangfang->getContentSize().width / 4,
					fangfang->getPositionY() + fangfang->getContentSize().height / 4);
				pExpColor = Color4F(253, 201, 0, 255);
				pExpTextureRect = Rect(35,491,9,9);
			}
			auto pExplostion = ParticleExplosion::create();
			pExplostion->setStartSize(3);
			pExplostion->setStartColor(pExpColor);
			pExplostion->setEndColor(pExplostion->getStartColor());
			pExplostion->setLife(0.1);
			pExplostion->setTotalParticles(100);
			pExplostion->setRotationIsDir(false);
			pExplostion->setAutoRemoveOnFinish(true);
			pExplostion->setPosition(pExpVec);
			pExplostion->setTextureWithRect(Director::getInstance()->getTextureCache()->addImage("watchout.png"), pExpTextureRect);
			pExplostion->setScale(0.5);
			top->addChild(pExplostion, 10);
		}else if(ffBox.getMaxX() < yyBox.getMinX() && 
			ffBox.getMinY() == 2 && 
			yyBox.getMinY() == 2) {//如果没有碰撞 && 方方/圆圆都没处于跳跃状态
			_gameState = GAME_STATE_RESET; //如果没有碰撞 && 方方/圆圆都没处于跳跃状态
			SimpleAudioEngine::getInstance()->playEffect(music_score);
			yuanyuan->setVisible(false);
			fangfang->setVisible(false);
			_score ++;

			//分数Label改变
			auto scoreBg = this->getChildByTag(tag_score_bg);
			LabelTTF* scoreLabel = (LabelTTF*)scoreBg->getChildByTag(tag_score_label);
			scoreLabel->setString(StringUtils::format("%i", _score));

			//分数增加(等级增加)，速度增加，背景颜色改变
			if(_score % 6 == 0) {
				_runSpeed += 0.5;
				int bgLevel = _score / 6;
				LayerColor* topBg = (LayerColor*)this->getChildByTag(tag_bg_top);
				LayerColor* bottomBg = (LayerColor*)this->getChildByTag(tag_bg_bottom);
				if(bgLevel == 1) {
					topBg->setColor(color_level_1);
					bottomBg->setColor(color_level_1_b);
					scoreLabel->setColor(color_level_1_cc3);
				}else if(bgLevel == 2) {
					topBg->setColor(color_level_2);
					bottomBg->setColor(color_level_2_b);
					scoreLabel->setColor(color_level_2_cc3);
				}
			}
		}
	}else if(_gameState == GAME_STATE_RESET) {
		resetRunner();
	}
}

bool WatchOut::onTouchBegan(Touch* touch, Event  *event) {
	auto top = this->getChildByTag(tag_bg_top);
	Sprite* yuanyuan = (Sprite*)top->getChildByTag(tag_yuanyuan);
	Sprite* fangfang = (Sprite*)top->getChildByTag(tag_fangfang);

	if(_gameState != GAME_STATE_PLAYING) {
		return true;
	}
	SimpleAudioEngine::getInstance()->playEffect(music_player_jump);
	Size winSize = Director::getInstance()->getVisibleSize();
	auto location = touch->getLocation();
	//≈–∂œ¥•√˛µƒŒª÷√£®◊Û/”“£©
	if(location.x >= winSize.width / 2) {
		//Ã¯‘æ
		auto jumpAction = fangfang->getActionByTag(tag_fangfangAction);
		if(!jumpAction) {
			fangfang->setSpriteFrame(SpriteFrameCache::getInstance()->getSpriteFrameByName("fangfang_jump.png"));
			jumpAction = Sequence::create(JumpBy::create(0.5, Vec2(-80,0), _jumpHeight, 1),
				CallFunc::create(CC_CALLBACK_0(WatchOut::callbackRunAction, this, fangfang)),
				nullptr);
			jumpAction->setTag(tag_fangfangAction);
			fangfang->runAction(jumpAction);
		}else if(jumpAction->isDone()) { //œ¬“ª¥Œµ„ª˜µƒ ±∫Ú£¨÷ª‘⁄Ã¯‘æÕÍ≥…≤≈”––ß
			fangfang->setSpriteFrame(SpriteFrameCache::getInstance()->getSpriteFrameByName("fangfang_jump.png"));
			fangfang->runAction(jumpAction);
		}
	}else {
		auto jumpAction = yuanyuan->getActionByTag(tag_yuanyuanAction);
		if(!jumpAction) {
			yuanyuan->setSpriteFrame(SpriteFrameCache::getInstance()->getSpriteFrameByName("yuanyuan_jump.png"));
			jumpAction = Sequence::create(JumpBy::create(0.5, Vec2(80,0), _jumpHeight, 1),
				CallFunc::create(CC_CALLBACK_0(WatchOut::callbackRunAction, this, yuanyuan)),
				nullptr);
			jumpAction->setTag(tag_yuanyuanAction);
			yuanyuan->runAction(jumpAction);
		}else if(jumpAction->isDone()) {
			yuanyuan->setSpriteFrame(SpriteFrameCache::getInstance()->getSpriteFrameByName("yuanyuan_jump.png"));
			yuanyuan->runAction(jumpAction);
		}
	}
	return true;
}

//ÀÊª˙≤˙…˙…ÌÃÂ–°µƒ
void WatchOut::resetRunner() {
	Size winSize = Director::getInstance()->getVisibleSize();

	auto top = this->getChildByTag(tag_bg_top);
	Sprite* yuanyuan = (Sprite*)top->getChildByTag(tag_yuanyuan);
	Sprite* fangfang = (Sprite*)top->getChildByTag(tag_fangfang);
	yuanyuan->setPosition(Vec2(2, 2));
	fangfang->setPosition(Vec2(winSize.width - fangfang->getContentSize().width - 2, 2));

	//ªÒµ√0-100ÀÊª˙ ˝ ≈–∂œ∆Ê≈º ˝
	int random = (int)(CCRANDOM_0_1() * 100) % 2;
	if(random == 0) {
		_currentTag = tag_yuanyuan;
		yuanyuan->setScale(0.5);
		fangfang->setScale(1);
	}else {
		_currentTag = tag_fangfang;
		fangfang->setScale(0.5);
		yuanyuan->setScale(1);
	}
	yuanyuan->setVisible(true);
	fangfang->setVisible(true);
	_gameState = GAME_STATE_PLAYING;
}

//Ã¯‘æ∫Ûµƒªÿµ˜∫Ø ˝ ªπ‘≠Sprite◊¥Ã¨
void WatchOut::callbackRunAction(Sprite* pTarget) {
	std::string name = pTarget->getTag() == tag_fangfang ? "fangfang.png" : "yuanyuan.png";
	pTarget->setSpriteFrame(SpriteFrameCache::getInstance()->getSpriteFrameByName(name));
}

//‘§º”‘ÿ“Ù–ßŒƒº˛
void WatchOut::preloadMusic() {
	SimpleAudioEngine::getInstance()->preloadEffect(music_button_touch);
	SimpleAudioEngine::getInstance()->preloadEffect(music_player_jump);
	SimpleAudioEngine::getInstance()->preloadEffect(music_score);
	SimpleAudioEngine::getInstance()->preloadEffect(music_player_die);
}