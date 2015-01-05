//
//  MJRefreshConst.h
//  MJRefresh
//
//  Created by mj on 14-1-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#ifdef DEBUG
#define MJLog(...) NSLog(__VA_ARGS__)
#else
#define MJLog(...)
#endif

// 文字颜色
#define MJRefreshLabelTextColor [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0]

extern const CGFloat MJRefreshViewHeight;
extern const CGFloat MJRefreshAnimationDuration;

extern NSString *const MJRefreshBundleName;
#define kSrcName(file) [MJRefreshBundleName stringByAppendingPathComponent:file]

extern NSString *const MJRefreshHeaderTimeKey;

extern NSString *const MJRefreshContentOffset;
extern NSString *const MJRefreshContentSize;

#define MJRefreshFooterPullToRefresh            @"更多"
#define MJRefreshFooterReleaseToRefresh         @"松开获取"
#define MJRefreshFooterRefreshing               @"获取中..."

#define MJRefreshHeaderPullToRefresh            @"下拉刷新"
#define MJRefreshHeaderReleaseToRefresh         @"松开刷新"
#define MJRefreshHeaderRefreshing               @"刷新中..."
