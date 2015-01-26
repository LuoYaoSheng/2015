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

int Logic::DisRepeat(unsigned char cbCardData[], int max, int len)
{
    int flags[max + 1];
    int i, j;
    
    //初始化标志数组
    for(i = 0; i <= max; i ++)
    {
        flags[i] = false;
    }
    
    //剔除算法
    for(i = 0; i < len; i ++)
    {
        flags[ cbCardData[i] ] = cbCardData[i];
    }
    
    //取出有效数
    for(i = 0, j = 0; i <= max; i ++)
    {
        if( flags[i] != false)
        {
            cbCardData[j ++] = flags[i];
        }
    }
    return j;
}

unsigned char Logic::GetCardType(unsigned char cbCardData[], unsigned char cbCardCount)
{
    //避免影响参数
    unsigned char temp[ cbCardCount ];
    memcpy(temp, cbCardData, cbCardCount);
    SortCardList(temp, cbCardCount);
    
    
    //快速写法，完成后再考虑优化问题
    
    switch ( cbCardCount ) {
        case 1:
        {
            return eA;
        }
            break;
        case 2:
        {
            if ( GetCardValue( temp[0] ) == GetCardValue( temp[1] ) ) {
                if ( temp[0] == 0x41 || temp[0] == 0x42 ) {
                    return eKK;
                }
                return eAA;
            }
        }
            break;
        case 3:
        {
            if ( GetCardValue( temp[0]) == GetCardValue( temp[1]) && GetCardValue( temp[0]) == GetCardValue( temp[2]) ) {
                return eAAA;
            }
        }
            break;
        case 4:
        {
            int icount = -1;//扣除自己
            for (int idx = 0; idx < cbCardCount; idx++) {
                if ( GetCardValue( temp[idx]) == GetCardValue( temp[1]) ) {
                    icount++;
                }
            }
            if ( icount == 3) return eAAAB;
            if ( icount == 4) return eAAAA;
        }
            break;
            
        case 5:
        {
            //是不是顺子 --- A、2、大小王 不能组成顺子
            //三带二 -- 两个不能是大小王
            //优先检测是否包含 三张 ，大小王
            
            int icount = -1;//扣除自己
            for (int idx = 0; idx < cbCardCount; idx++) {
                if ( GetCardValue( temp[idx]) == GetCardValue( temp[2]) ) {
                    icount++;
                }
            }
            if ( icount == 3){
                if (  (GetCardValue( temp[0]) == GetCardValue( temp[2]) &&  GetCardValue( temp[3]) == GetCardValue( temp[4])  )
                    || (GetCardValue( temp[3]) == GetCardValue( temp[2]) &&  GetCardValue( temp[0]) == GetCardValue( temp[1])) ) {
                    return eAAABB;
                }
            }else if( icount == 1){
                //从大到小
                if (!( temp[0] == 0x41 || temp[0] == 0x42 || GetCardValue( temp[0] ) == 1|| GetCardValue( temp[0] ) == 2) ) {
                    if ( 1 == temp[0]-temp[1] && 1 == temp[1]-temp[2] && 1 == temp[2]-temp[3] && 1 == temp[3]-temp[4] ) {
                        return eABCDEF;
                    }
                }
            }
        }
            break;
        case 6:
        {
            int icount = -1;//扣除自己
            int iOther = -1;
            for (int idx = 0; idx < cbCardCount; idx++) {
                if ( GetCardValue( temp[idx]) == GetCardValue( temp[3]) ) {
                    icount++;
                    iOther = idx;
                }
            }
            if ( icount == 4 ) {
                if ( (iOther == 5 && (temp[0] != 0x41 || temp[0] != 0x42) && GetCardValue(temp[0]) != GetCardValue(temp[1]) )
                    || ( iOther == 4 && (temp[0] != 0x41 || temp[0] != 0x42) && GetCardValue(temp[0]) != GetCardValue(temp[5]) )
                    || ( iOther == 3  && GetCardValue(temp[4]) != GetCardValue(temp[5]) ) ){
                    return eAAAABC;
                }
            }else if ( icount == 3){
                if ( (GetCardValue(temp[0]) == GetCardValue(temp[1]) && GetCardValue(temp[1]) == GetCardValue(temp[2]))
                    && (GetCardValue(temp[3]) == GetCardValue(temp[4]) && GetCardValue(temp[4]) == GetCardValue(temp[5])) ) {
                    return eAAABBB;
                }
            }else if ( icount == 2){
                
                if ( GetCardValue(temp[0]) == GetCardValue(temp[1]) && GetCardValue(temp[2]) == GetCardValue(temp[3]) && GetCardValue(temp[4]) == GetCardValue(temp[5]) &&  GetCardValue(temp[0]) - GetCardValue(temp[2]) == 1 &&  GetCardValue(temp[2]) - GetCardValue(temp[4]) == 1)  {
                    return eAABBCC;
                }
                
            }else if ( icount == 1){
                
                if (!( temp[0] == 0x41 || temp[0] == 0x42 || GetCardValue( temp[0] ) == 1|| GetCardValue( temp[0] ) == 2) ) {
                    if ( 1 == temp[0]-temp[1] && 1 == temp[1]-temp[2] && 1 == temp[2]-temp[3] && 1 == temp[3]-temp[4] && 1 == temp[4]-temp[5] ) {
                        return eABCDEF;
                    }
                }
                
            }
        }
            break;
            case 7:
        {
            if (!( temp[0] == 0x41 || temp[0] == 0x42 || GetCardValue( temp[0] ) == 1|| GetCardValue( temp[0] ) == 2) ) {
                if ( 1 == temp[0]-temp[1] && 1 == temp[1]-temp[2] && 1 == temp[2]-temp[3] && 1 == temp[3]-temp[4] && 1 == temp[4]-temp[5] && 1 == temp[5]-temp[6] ) {
                    return eABCDEF;
                }
            }
        }
            break;
            
        default:
        {
            if ( !( temp[0] == 0x41 || temp[0] == 0x42) ) {
                //顺子检测
                if ( GetCardValue( temp[0] ) != 2 ) {
                    for (int idx = 0; idx < cbCardCount; idx++) {
                        if ( idx == cbCardCount-1) {
                            return eABCDEF;
                        }
                        if ( temp[idx] - temp[idx+1] != 1) {
                            break;
                        }
                    }
                }else{

                    //去重
                    unsigned char temp2[ cbCardCount ];
                    for (int idx = 0; idx < cbCardCount; idx++) {
                        temp2[ idx ] = GetCardLogicValue( temp[idx] );
                    }
                    
                    int left = DisRepeat( temp2, temp2[0], cbCardCount);
                    unsigned char countData[ left ] ;
                    for (int i = 0; i < left; i++) {
                        unsigned char value = temp2[ i ];
                        int k = 0;
                        for (int j = 0; j < cbCardCount; j++) {
                            if ( value == GetCardLogicValue( temp[j] ) ) {
                                k++;
                            }
                        }
                        countData[i] = k;
                    }
                    
                    unsigned char values[left];
                    memcpy(values, temp2, sizeof(unsigned char)*left);
                    SortCardList(values, left);
                    
                    //每一种情况统计 -- eAAAABBCC
                    if ( values[0]==4&&values[1]==2&&values[2]==2 && values[3]==0  ) {
                        return eAAAABBCC;
                    }
                    //
                    if ( (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 ) )   //9张
                        || (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==3&&values[4]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 && GetCardLogicValue(temp[6]) - GetCardLogicValue(temp[9]) ==1 ) ) //12张
                        || (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==3&&values[4]==3&&values[5]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 && GetCardLogicValue(temp[6]) - GetCardLogicValue(temp[9]) ==1 && GetCardLogicValue(temp[9]) - GetCardLogicValue(temp[12]) ==1 ) ) //15张
                        || (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==3&&values[4]==3&&values[5]==3&&values[6]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 && GetCardLogicValue(temp[6]) - GetCardLogicValue(temp[9]) ==1 && GetCardLogicValue(temp[9]) - GetCardLogicValue(temp[12]) ==1 && GetCardLogicValue(temp[12]) - GetCardLogicValue(temp[15]) ==1 ) ) //18张
                        ) {
                        return eAAABBB;
                    }
                    //
                    if ( ( values[0]==2 && values[1]==2 && values[2]==2 && values[3]==2 )
                            && (GetCardLogicValue(temp[0])-GetCardLogicValue(temp[2])==1&&GetCardLogicValue(temp[2])-GetCardLogicValue(temp[4])==1&&GetCardLogicValue(temp[4])-GetCardLogicValue(temp[6])==1 ) ) {
                        return eAABBCC;
                    }
                    if ( ( values[0]==2 && values[1]==2 && values[2]==2 && values[3]==2 && values[4]==2 && values[5]==2)
                        && (GetCardLogicValue(temp[0])-GetCardLogicValue(temp[2])==1&&GetCardLogicValue(temp[2])-GetCardLogicValue(temp[4])==1&&GetCardLogicValue(temp[4])-GetCardLogicValue(temp[6])==1&&GetCardLogicValue(temp[6])-GetCardLogicValue(temp[8])==1&&GetCardLogicValue(temp[8])-GetCardLogicValue(temp[10])==1 ) ) {
                        return eAABBCC;
                    }
                    if ( ( values[0]==2 && values[1]==2 && values[2]==2 && values[3]==2 && values[4]==2 && values[5]==2&& values[6]==2)
                        && (GetCardLogicValue(temp[0])-GetCardLogicValue(temp[2])==1&&GetCardLogicValue(temp[2])-GetCardLogicValue(temp[4])==1&&GetCardLogicValue(temp[4])-GetCardLogicValue(temp[6])==1&&GetCardLogicValue(temp[6])-GetCardLogicValue(temp[8])==1&&GetCardLogicValue(temp[8])-GetCardLogicValue(temp[10])==1 &&GetCardLogicValue(temp[10])-GetCardLogicValue(temp[12])==1) ) {
                        return eAABBCC;
                    }
                    if ( ( values[0]==2 && values[1]==2 && values[2]==2 && values[3]==2 && values[4]==2 && values[5]==2&& values[6]==2&& values[7]==2)
                        && (GetCardLogicValue(temp[0])-GetCardLogicValue(temp[2])==1&&GetCardLogicValue(temp[2])-GetCardLogicValue(temp[4])==1&&GetCardLogicValue(temp[4])-GetCardLogicValue(temp[6])==1&&GetCardLogicValue(temp[6])-GetCardLogicValue(temp[8])==1&&GetCardLogicValue(temp[8])-GetCardLogicValue(temp[10])==1 &&GetCardLogicValue(temp[10])-GetCardLogicValue(temp[12])==1&&GetCardLogicValue(temp[12])-GetCardLogicValue(temp[14])==1) ) {
                        return eAABBCC;
                    }
                    if ( ( values[0]==2 && values[1]==2 && values[2]==2 && values[3]==2 && values[4]==2 && values[5]==2&& values[6]==2&& values[7]==2&& values[8]==2)
                        && (GetCardLogicValue(temp[0])-GetCardLogicValue(temp[2])==1&&GetCardLogicValue(temp[2])-GetCardLogicValue(temp[4])==1&&GetCardLogicValue(temp[4])-GetCardLogicValue(temp[6])==1&&GetCardLogicValue(temp[6])-GetCardLogicValue(temp[8])==1&&GetCardLogicValue(temp[8])-GetCardLogicValue(temp[10])==1 &&GetCardLogicValue(temp[10])-GetCardLogicValue(temp[12])==1&&GetCardLogicValue(temp[12])-GetCardLogicValue(temp[14])==1&&GetCardLogicValue(temp[14])-GetCardLogicValue(temp[16])==1) ) {
                        return eAABBCC;
                    }
                    if ( ( values[0]==2 && values[1]==2 && values[2]==2 && values[3]==2 && values[4]==2 && values[5]==2&& values[6]==2&& values[7]==2&& values[8]==2&& values[10]==2)
                        && (GetCardLogicValue(temp[0])-GetCardLogicValue(temp[2])==1&&GetCardLogicValue(temp[2])-GetCardLogicValue(temp[4])==1&&GetCardLogicValue(temp[4])-GetCardLogicValue(temp[6])==1&&GetCardLogicValue(temp[6])-GetCardLogicValue(temp[8])==1&&GetCardLogicValue(temp[8])-GetCardLogicValue(temp[10])==1 &&GetCardLogicValue(temp[10])-GetCardLogicValue(temp[12])==1&&GetCardLogicValue(temp[12])-GetCardLogicValue(temp[14])==1&&GetCardLogicValue(temp[14])-GetCardLogicValue(temp[16])==1&&GetCardLogicValue(temp[16])-GetCardLogicValue(temp[18])==1) ) {
                        return eAABBCC;
                    }
                    //
                    if ( (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==1&&values[4]==1&&values[5]==0
                          && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 ) )   //9张
                        || (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==3&&values[4]==1&&values[5]==1&&values[6]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 && GetCardLogicValue(temp[6]) - GetCardLogicValue(temp[9]) ==1 ) ) //12张
                        || (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==3&&values[4]==3&&values[5]==1&&values[6]==1&&values[7]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 && GetCardLogicValue(temp[6]) - GetCardLogicValue(temp[9]) ==1 && GetCardLogicValue(temp[9]) - GetCardLogicValue(temp[12]) ==1 ) ) //15张
                        || (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==3&&values[4]==3&&values[5]==3&&values[6]==1&&values[7]==1&&values[8]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 && GetCardLogicValue(temp[6]) - GetCardLogicValue(temp[9]) ==1 && GetCardLogicValue(temp[9]) - GetCardLogicValue(temp[12]) ==1 && GetCardLogicValue(temp[12]) - GetCardLogicValue(temp[15]) ==1 ) ) //18张
                        ) {
                        return eAAABBBCD;
                    }
                    //
                    if ( (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==2&&values[4]==2&&values[5]==0
                          && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 ) )   //9张
                        || (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==3&&values[4]==2&&values[5]==2&&values[6]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 && GetCardLogicValue(temp[6]) - GetCardLogicValue(temp[9]) ==1 ) ) //12张
                        || (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==3&&values[4]==3&&values[5]==2&&values[6]==2&&values[7]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 && GetCardLogicValue(temp[6]) - GetCardLogicValue(temp[9]) ==1 && GetCardLogicValue(temp[9]) - GetCardLogicValue(temp[12]) ==1 ) ) //15张
                        || (values[0]==3&&values[1]==3&&values[2]==3&&values[3]==3&&values[4]==3&&values[5]==3&&values[6]==2&&values[7]==2&&values[8]==0
                            && (GetCardLogicValue(temp[0]) - GetCardLogicValue(temp[3]) ==1 && GetCardLogicValue(temp[3]) - GetCardLogicValue(temp[6]) ==1 && GetCardLogicValue(temp[6]) - GetCardLogicValue(temp[9]) ==1 && GetCardLogicValue(temp[9]) - GetCardLogicValue(temp[12]) ==1 && GetCardLogicValue(temp[12]) - GetCardLogicValue(temp[15]) ==1 ) ) //18张
                        ) {
                        return eAAABBBCCDD;
                    }
                }
            }
        }
            
            break;
    }
    return eErr;
}
bool Logic::GetCardMini(unsigned char dest[],unsigned char src[], unsigned char output[], int count)
{
    //获取 源 牌型 以及最大牌
    int srcType = Logic::GetCardType( src, count);
    
    
    
    return false;
}
bool Logic::GetValid(unsigned char cbCardData[], int count)
{
    return Logic::GetCardType( cbCardData, count);
}


