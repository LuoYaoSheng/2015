//
//  Logic.cpp
//  lys
//
//  Created by 罗耀生 on 15/1/7.
//
//

#include "Logic.h"
#include "cocos2d.h"
USING_NS_CC;

#define MULTIPLE    1000
#define ROW2COL(row,col)  (row *MULTIPLE + col)

static Logic *s_SharedLogic = nullptr;

Logic* Logic::getInstance()
{
    if (!s_SharedLogic)
    {
        s_SharedLogic = new (std::nothrow) Logic();
        CCASSERT(s_SharedLogic, "FATAL: Not enough memory");
        s_SharedLogic->init();
    }
    
    return s_SharedLogic;
}

Logic::Logic(void){}
Logic::~Logic(){}
bool Logic::init()
{
    store_graph();
    
    return true;
}

void Logic::store_graph()
{
    for (int i = 0; i < ROW_NUM; i++) {
        for (int j = 0; j < COL_NUM; j++) {
            
            int color = abs(rand()% COLOR_MAX_NUM );
//            _graph[i][j] = color;
            _graph[i][j] = 1;
        }
    }

    _graph[0][2] = 0;
    _graph[1][2] = 0;
    _graph[1][1] = 0;
}

bool Logic::adjoin(int row, int col) //是否邻接点
{
    if ( row < 0 || col < 0) return false;          //越界检测
    if ( _graph[ row ][ col ] < 0) return false;    //数值检测
    for (int idx = 0; idx < _visitedCount; idx++)   //包含检测
        if ( ROW2COL(row,col) == _visited[ idx] ) return false;

    return _target == _graph[ row ][ col ] ;
}

void Logic::dfs_graph(int row, int col)
{
    if ( adjoin( row, col) ) {
        setVisited( row, col);
        if ( adjoin( row-1, col) ) dfs_graph( row-1, col);
        if ( adjoin( row+1, col) ) dfs_graph( row+1, col);
        if ( adjoin( row, col-1) ) dfs_graph( row, col-1);
        if ( adjoin( row, col+1) ) dfs_graph( row, col+1);
    }
}
//向下迁移
void Logic::move_down(int pCol)
{
    int graph[ COL_NUM ] ;
    memset( graph, -1, sizeof( int )*COL_NUM );
    
    int idx = 0;
    
    for (int row = ROW_NUM-1; row >= 0; row--)
        if ( -1 != mCurGraph[ row ][ pCol ] ) graph[ idx++ ] = mCurGraph[ row ][ pCol ];
    
    idx = 0;
    for (int row = ROW_NUM-1; row >= 0; row--) mCurGraph[ row ][ pCol ] = graph[ idx++ ];
}

//向左迁移
void Logic::move_left(int pCol)
{
    
    printf("\n==%d", pCol);
    
    if ( -1 == mCurGraph[ ROW_NUM-1 ][ pCol ]  ) {
//        for (int row = 0; row < ROW_NUM; row++) mCurGraph[ row ][ pCol ] = mCurGraph[ row ][ pCol+1 ];
        printf(" -----");
    }
}

void Logic::regroup()
{
    memcpy( mCurGraph, _graph, sizeof( int )*ROW_NUM*COL_NUM );
    memcpy( mPreGraph, _graph, sizeof( int )*ROW_NUM*COL_NUM );
    
    for (int idx = 0; idx < _visitedCount; idx++) {
        mCurGraph[ _visited[ idx ]/MULTIPLE ][ _visited[ idx ]%MULTIPLE ] = -1;
    }

    
    memcpy( _graph, mCurGraph, sizeof( int )*ROW_NUM*COL_NUM );
    descriptionGraph();
    
    //向下迁移
        for (int col = 0; col < COL_NUM; col++) {
            move_down( col );
        }
    
    memcpy( _graph, mCurGraph, sizeof( int )*ROW_NUM*COL_NUM );
    descriptionGraph();
    
    //向左迁移
    for (int col = COL_NUM-1; col >= 0; col--) {
        move_left( col );
    }

    memcpy( _graph, mCurGraph, sizeof( int )*ROW_NUM*COL_NUM );
    descriptionGraph();
    
}

int Logic::pitchOn(int row, int col)
{
    _target = _graph[ row ][ col ];

    memset( _visited, -1, sizeof( int )*ROW_NUM*COL_NUM );
    _visitedCount = 0;
    dfs_graph( row, col);
    regroup();
    
    
    /*
     
     _target = _graph[ row ][ col ];
     printf("\n选中:%d\n", _target );
     printf("dfs遍历结果:");
     
     memset( _visited, -1, sizeof( int )*ROW_NUM*COL_NUM );
     
     _visitedCount = 0;
     dfs_graph( row, col);
     regroup();
     
    printf("%d  ", _visitedCount);

    for (int idx = 0; idx < _visitedCount; idx++) {
        printf("(%d,%d,%d) ", _visited[ idx ], _visited[ idx ]/MULTIPLE, _visited[ idx ]%MULTIPLE);
    }
    
    //如果邻接点是，那么回调 -- 当前点是否原来的点，是否记录过，记录过则不计算邻接点
    
    
    printf("\n");
*/
    
    
    return SCORE * _visitedCount * _visitedCount;
}

int Logic::leftAward()
{
    int left = 5;
    int count = LEFT - left;
    return SCORE * count * count;
}

bool Logic::isOver()
{

    return false;
}

void Logic::setVisited(int row, int col)
{
    _visited[ _visitedCount++ ] = ROW2COL(row,col);
}

void Logic::descriptionGraph()
{
    printf("\ndescriptionGraph:");
    for (int i = 0; i < ROW_NUM; i++) {
        printf("\n");
        for (int j = 0; j < COL_NUM; j++) {
            printf("%d ", _graph[i][j] );
        }
    }
    printf("\n");
}