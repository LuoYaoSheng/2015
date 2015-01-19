//
//  Start.h
//  lys
//
//  Created by 罗耀生 on 15/1/9.
//
//

#ifndef __lys__Start__
#define __lys__Start__

#include "cocos2d.h"


class Star : public cocos2d::Sprite{
public:
    enum color{
        GREEN,
        RED,
        YELLOW,
        PURPLE,
        BLUE
    };
    static Star* create(int color);
    bool isSelected();
    inline void setSelected(bool b){ _selected = b;}
    int getColor();
    void setDesPosition(const cocos2d::Point& p);
    inline cocos2d::Point getDesPosition(){return desPosition;}
    void updatePosition();
    inline int getIndexRow(){return _row;}
    inline int getIndexCol(){return _col;}
    inline void setIndex_RowCol(int row,int col){_row = row;_col = col;}
private:
    const char* getImage(int color);
    
public:
    const static int MOVE_SPEED = 4;
    static const int COLOR_MAX_NUM = 5;
    static const int STAR_WIDTH = 48;
    static const int STAR_HEIGHT = 48;
private:
    int _color;
    cocos2d::Point desPosition;
    bool _selected;
    int _row;
    int _col;
};


#endif /* defined(__lys__Start__) */
