#ifndef __WATCHOUT_SCENE_H__
#define __WATCHOUT_SCENE_H__

#include "cocos2d.h"
#include "resource.h"

class WatchOut : public cocos2d::Layer
{
public:
    static cocos2d::Scene* createScene();

    virtual bool init();  
    
    CREATE_FUNC(WatchOut);
	//��ʼ����ͼ
	void setupView();
	//��ʼ��Ϸ
	void startGame(cocos2d::Ref* pSender);
	//scheduleUpdateÿ֡���÷���
	void update(float dt);
	//�����¼�
	bool onTouchBegan(cocos2d::Touch* touch, cocos2d::Event  *event);
	//����ִ����ɻص�
	void callbackRunAction(cocos2d::Sprite* pTarget);
	
private:
	//��Ϸ״̬
	GAME_STATE _gameState;
	//��Ծ�߶�
	float _jumpHeight;
	//�ƶ��ٶ�
	float _runSpeed;
	//����
	int _score;
	//��ǰС��TAG
	int _currentTag;

	//Ԥ������Ч�ļ�
	void preloadMusic();
	//����yuanyuan/fangfang(�����������С��)
	void resetRunner();
};

#endif // __WATCHOUT_SCENE_H__
