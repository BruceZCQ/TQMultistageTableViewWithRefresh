//
//  TQMultistageTableView+Loading.h
//  TQTableViewDemo
//
//  Created by BruceZCQ on 14-1-22.
//  Copyright (c) 2014年 BruceZCQ. All rights reserved.
//


#import "TQMultistageTableView.h"
#import "TQMultistageTableViewLoadingConfig.h"

typedef enum
{
    //same
	SameState,
    //different
	DifferentState,
} DataStateType;

@interface TQMultistageTableView (Loading)

- (void)loadSlimeRefreshView;
- (void)loadData;
- (void)loadMoreData;

- (void)initDataState:(BOOL)state type:(DataStateType)type;
@end
