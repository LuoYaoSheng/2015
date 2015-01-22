//
//  Logic.cpp
//  texasodds
//
//  Created by lys on 14-5-3.
//
//

#include "Logic.h"
#include <stdlib.h>
#include <string.h>
#include <assert.h>

unsigned char m_cbCardData[FULL_COUNT];				//扑克定义

void Logic::initCardList(unsigned char cbCardData[], unsigned char cbCardCount)
{
    memset(cbCardData, 0, sizeof(unsigned char) * cbCardCount );
    memset(m_cbCardData, 0, sizeof(unsigned char) * cbCardCount );
    
    unsigned char temp[FULL_COUNT] = {
        0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,	//方块 A - K
        0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,	//梅花 A - K
        0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2A,0x2B,0x2C,0x2D,	//红桃 A - K
        0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x3A,0x3B,0x3C,0x3D,	//黑桃 A - K
        0x41,0x42,                                                          //大小王
    };
    
    for (int i = 0; i < FULL_COUNT; i++) {
        cbCardData[i] = temp[i];
        m_cbCardData[i] = temp[i];
    }
}

//控制函数
//排列扑克
void Logic::SortCardList(unsigned char cbCardData[], unsigned char cbCardCount){
   	//转换数值
	unsigned char cbLogicValue[FULL_COUNT];
	for (unsigned char i=0;i<cbCardCount;i++)
		cbLogicValue[i]=GetCardLogicValue(cbCardData[i]);
    
	//排序操作
	unsigned char bSorted=1;
	unsigned char cbTempData,bLast=cbCardCount-1;
	do
	{
		bSorted=1;
		for (unsigned char i=0;i<bLast;i++)
		{
			if ((cbLogicValue[i]<cbLogicValue[i+1])||
				((cbLogicValue[i]==cbLogicValue[i+1])&&(cbCardData[i]<cbCardData[i+1])))
			{
				//交换位置
				cbTempData=cbCardData[i];
				cbCardData[i]=cbCardData[i+1];
				cbCardData[i+1]=cbTempData;
				cbTempData=cbLogicValue[i];
				cbLogicValue[i]=cbLogicValue[i+1];
				cbLogicValue[i+1]=cbTempData;
				bSorted=0;
			}
		}
		bLast--;
	} while(bSorted==0);
    
	return;
}
//混乱扑克
void Logic::RandCardList(unsigned char cbCardBuffer[], unsigned char cbBufferCount){
	unsigned char cbCardData[CountArray(m_cbCardData)];
	memcpy(cbCardData,m_cbCardData,sizeof(m_cbCardData));
    
	//混乱扑克
	unsigned char cbRandCount=0,cbPosition=0;
	do
	{
		cbPosition = arc4random()%(cbBufferCount-cbRandCount);
		cbCardBuffer[cbRandCount++]=cbCardData[cbPosition];
		cbCardData[cbPosition]=cbCardData[cbBufferCount-cbRandCount];
	} while (cbRandCount < cbBufferCount);
    
	return;
}

//功能函数
//逻辑数值
unsigned char Logic::GetCardLogicValue(unsigned char cbCardData){
    //扑克属性
	unsigned char bCardValue=GetCardValue(cbCardData);
    
	//转换数值
    switch ( bCardValue) {
        case 1:
            bCardValue += 13;
            break;
        case 2:
            bCardValue += 14;
            break;
        default:
            break;
    }
	return bCardValue;
}

unsigned char Logic::GetCardValue(unsigned char cbCardData){
    return cbCardData&LOGIC_MASK_VALUE;
}

unsigned char Logic::GetCardColor(unsigned char cbCardData){
    return cbCardData&LOGIC_MASK_COLOR;
}

