//
//  Logic.h
//  lys
//
//  Created by 罗耀生 on 15/1/7.
//
//

#ifndef __lys__Logic__
#define __lys__Logic__

#include <stdio.h>

#define ROW_NUM             10
#define COL_NUM             10
#define COLOR_MAX_NUM       5
#define SCORE               5
#define LEFT                10

class Logic {
public:

    static Logic* getInstance();

    void store_graph();//邻接矩阵存储图
    
    void move_down(int col);
    void move_left(int col);
    void regroup();
    int pitchOn(int row, int col);
    int leftAward();
    int isOver();
    
    void descriptionGraph();

    int mCurGraph[ ROW_NUM ][ COL_NUM ];
    int mPreGraph[ ROW_NUM ][ COL_NUM ];

public:
    Logic(void);
    virtual ~Logic();
    virtual bool init();

protected:
    bool adjoin(int row, int col); //是否邻接点
    void dfs_graph(int row, int col);
    
private:
    int _graph[ ROW_NUM ][ COL_NUM ];
    int _visited[ ROW_NUM*COL_NUM ];
    int _target;
    
    int _visitedCount;
    void setVisited(int row, int col);
};

#endif /* defined(__lys__Logic__) */
