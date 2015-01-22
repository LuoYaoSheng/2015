//
//  Logic.h
//  texasodds
//
//  Created by lys on 14-5-3.
//
//

#ifndef __texasodds__Logic__
#define __texasodds__Logic__

#include <stdio.h>

#define CountArray(array) (sizeof(array)/sizeof(array[0]))

#define BYTE unsigned char
#define GAME_PLAYER 10
#define MAX_COUNT 2
#define MAX_CENTERCOUNT 5
#define FULL_COUNT  54

//数值掩码
#define	LOGIC_MASK_COLOR			0xF0								//花色掩码
#define	LOGIC_MASK_VALUE			0x0F								//数值掩码

//扑克类型
#define CT_SINGLE				1									//单牌类型
#define CT_ONE_LONG				2									//对子类型
#define CT_TWO_LONG				3									//两对类型
#define CT_THREE_TIAO			4									//三条类型
#define	CT_SHUN_ZI				5									//顺子类型
#define CT_TONG_HUA				6									//同花类型
#define CT_HU_LU				7									//葫芦类型
#define CT_TIE_ZHI				8									//铁支类型
#define CT_TONG_HUA_SHUN		9									//同花顺型
#define CT_KING_TONG_HUA_SHUN	10									//皇家同花顺

//胜利信息结构
typedef struct
{
	unsigned char bSameCount;
	unsigned char wWinerList[GAME_PLAYER];
}UserWinList;

//分析结构
typedef struct
{
	unsigned char 							cbFourCount;					//四张数目
	unsigned char 							cbThreeCount;					//三张数目
	unsigned char 							cbLONGCount;					//两张数目
	unsigned char							cbSignedCount;					//单张数目
	unsigned char 							cbFourLogicVolue[1];				//四张列表
	unsigned char 							cbThreeLogicVolue[1];				//三张列表
	unsigned char 							cbLONGLogicVolue[2];				//两张列表
	unsigned char 							cbSignedLogicVolue[5];				//单张列表
	unsigned char							cbFourCardData[MAX_CENTERCOUNT];		//四张列表
	unsigned char							cbThreeCardData[MAX_CENTERCOUNT];		//三张列表
	unsigned char							cbLONGCardData[MAX_CENTERCOUNT];		//两张列表
	unsigned char							cbSignedCardData[MAX_CENTERCOUNT];		//单张数目
}tagAnalyseResult;


class Logic {
public:    
    //初始化扑克数据
    static void initCardList(unsigned char cbCardData[], unsigned char cbCardCount);
    static void SortCardList(unsigned char cbCardData[], unsigned char cbCardCount);
    static void RandCardList(unsigned char cbCardBuffer[], unsigned char cbBufferCount);
    
    //功能函数 --
    static unsigned char GetCardLogicValue(unsigned char cbCardData);
    static unsigned char GetCardValue(unsigned char cbCardData);
    static unsigned char GetCardColor(unsigned char cbCardData);
    
};

#endif /* defined(__texasodds__Logic__) */
