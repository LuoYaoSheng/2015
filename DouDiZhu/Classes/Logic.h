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
enum CT_Type{
    eErr  = 0,
    eA = 1,                                                             //单张：可以是手中的任意一张牌 （如 ◆ 8 ）
    eAA,                                                                //一对：两张牌点相同的牌，两张牌的花色可以不同（如 88 ）
    eAAA,                                                               //三同张：三张牌点相同的牌，三张牌的花色可以不同（如 888 ）
    eAAAB,                                                              //三带一：三张牌点相同的牌和另外一张牌一起出。 ( 如 888+9)
    eAAABB,                                                             //三带二：三张牌点相同的牌和另外两张牌点相同的牌一起出。 ( 如 888+99)
    eAAAABC,                                                            //四带二单：必须带两张单牌，不能带大王，小王 ( 如 8888+79)
    eAAAABBCC,                                                          //四带二对：必须带两个对牌，对子可以不用相连。如 8888+7799)
    eABCDEF,                                                            //单顺：必须 5 张或 5 张以上连续的单牌，且其中不能有 2 或大小王 ( 如 45678 或 10JQKA)
    eAABBCC,                                                            //对顺 ( 连对 ) ：必须 3 对或 3 对以上连续的对牌，且其中不能有 2 或大小王 ( 如 667788 或 3344556677)
    eAAABBB,                                                            //三顺（连三条）：必须 2 个或 2 个以上连续的三张牌，且其中不能有 2 或大小王：如： 333444 、 555666777888 ）
    eAAABBBCD,                                                          //三顺带一：必须 2 个或 2 个以上连续的三张牌，加上相同牌数的任意单牌，且任意单牌中不能含有大小王（如： 444555+79 ）
    eAAABBBCCDD,                                                        //三顺带对：类似三顺带一，区别是带牌必须为对牌 （如： 444555+77 或 333444555+7799JJ ）
    eAAAA,                                                              //炸弹：四张一样牌点的牌（如 8888 ）
    eKK,                                                                //火箭：大王跟小王一起为火箭
};

class Logic {
public:
    //初始化扑克数据
    static void initCardList(unsigned char cbCardData[], unsigned char cbCardCount);
    static void SortCardList(unsigned char cbCardData[], unsigned char cbCardCount);
    static void RandCardList(unsigned char cbCardBuffer[], unsigned char cbBufferCount);
    
    //功能函数 -- 基本
    static unsigned char GetCardLogicValue(unsigned char cbCardData);
    static unsigned char GetCardValue(unsigned char cbCardData);
    static unsigned char GetCardColor(unsigned char cbCardData);
    
    
    static int DisRepeat(unsigned char cbCardData[], int max, int len);
    
    //功能函数
    static unsigned char GetCardType(unsigned char cbCardData[], unsigned char cbCardCount);                    //获得牌型
    static bool GetCardMini(unsigned char dest[],unsigned char src[], unsigned char output[], int count);        //获得压过对方最小牌型 -- 没有则返回空数组
    static bool GetValid(unsigned char cbCardData[], int count);                                                //选中牌是否有效

};

#endif /* defined(__texasodds__Logic__) */
