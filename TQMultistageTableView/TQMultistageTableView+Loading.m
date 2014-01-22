//
//  TQMultistageTableView+Loading.m
//  TQTableViewDemo
//
//  Created by BruceZCQ on 14-1-22.
//  Copyright (c) 2014年 BruceZCQ. All rights reserved.
//

#import "TQMultistageTableView+Loading.h"

#import "TQMultistageTableView+InvokeDelegate.h"

@implementation TQMultistageTableView (Loading)

#pragma mark - SlimeRefreshView
- (void)loadSlimeRefreshView
{
    self.slimeView = (SRRefreshView *)[self viewWithTag:kRefreshingViewTag];
    if (self.slimeView != nil) {
        self.slimeView.slimeStopInTime = YES;
        [self.slimeView removeFromSuperview];
    }
    //add refresh
    self.slimeView = [[SRRefreshView alloc] init];
    self.slimeView.delegate = self;
    
    self.slimeView.slimeMissWhenGoingBack = NO;
    self.slimeView.slime.lineWith = 1;
    self.slimeView.slime.shadowBlur = 2;
    self.slimeView.slime.shadowColor = [UIColor blackColor];
    self.slimeView.slime.bodyColor = kRefreshBodyColor;
    self.slimeView.slime.skinColor = kRefreshSkinColor;
    self.slimeView.tag = kRefreshingViewTag;
    [self.tableView addSubview:self.slimeView];
    
    //start refreshing:开始自动loading
    [self.slimeView setLoadingWithexpansion];
}

#pragma mark - Refresh delegate

//slime刷新完成，再次获取默认数据，初始需要在子类中重新填充数据
- (void)slimeRefreshStartRefresh:(SRRefreshView*)refreshView
{
    [self loadData];
}

//刷新获得新数据完成，更新tableview
- (void)slimeRefreshEndRefresh:(SRRefreshView *)refreshView
{
    if (self.parentContoller != nil) {
        //[self reloadDataAfterDelay];
        [self reloadData];
        self.userInteractionEnabled = YES;
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.slimeView scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    [self.slimeView scrollViewDidEndDraging];
}

- (void)stopRefreshAfterDelay
{
    if (self.slimeView.loading == YES) {
        [self.slimeView performSelector:@selector(endRefresh)
                         withObject:nil afterDelay:kDelayEndRefreshTime];
    }
}

#pragma mark - load Data

- (void)loadData
{
    //close UserInteractions
    self.userInteractionEnabled = NO;
    
    __block NSInteger dataCnt = 0;
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if ([self.dataSource respondsToSelector:@selector(loadData)]) {
            dataCnt = [self.dataSource loadData];
        }
        
        dispatch_async( dispatch_get_main_queue(), ^{
            
            //reset data state
            [self initDataState:NO type:DifferentState];
            
            if (dataCnt == 0) {
                [self initDataState:YES type:DifferentState];
            } else {
                [self initDataState:NO type:DifferentState];
            }
            
            [self stopRefreshAfterDelay];
        });
    });
}

- (void)loadMoreData
{
    NSLog(@"loadingMore Data");
    //close UserInteractions
    self.userInteractionEnabled = NO;
    
    //reset data state
    [self initDataState:NO type:DifferentState];

    __block NSInteger dataCnt = 0;
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if ([self.dataSource respondsToSelector:@selector(loadMoreData)]) {
            dataCnt = [self.dataSource loadMoreData];
        }
        
        dispatch_async( dispatch_get_main_queue(), ^{
            //reset data state
            [self initDataState:NO type:DifferentState];
            
            if (dataCnt%kPeerPageCellCount == 0) {
                [self initDataState:YES type:SameState];
            } else {
                [self initDataState:YES type:DifferentState];
            }
            self.userInteractionEnabled = YES;
            [self reloadDataAfterDelay];
        });
    });
}

//reload and update TQTableView

- (void)reloadDataAfterDelay
{
    if (self.parentContoller != nil) {
        [self performSelector:@selector(reloadData)
                   withObject:nil afterDelay:kReloadDataDelayTime];
    }
}

- (void)initDataState:(BOOL)state type:(DataStateType)type
{
    if (type == SameState) {
        self.noData = state;
        self.hasMoreData = state;
    }
    if (type == DifferentState) {
        self.noData = state;
        self.hasMoreData = !state;
    }
}

- (void)resetDataState:(BOOL)state
{
    self.noData = state;
    self.hasMoreData = !state;
}

#pragma mark - Common Logic

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
    [super setUserInteractionEnabled:userInteractionEnabled];
    [self resetSubViewsUserInteraction:userInteractionEnabled];
}

- (void)resetSubViewsUserInteraction:(BOOL)state
{
    for (UIView *subView in self.subviews) {
        subView.userInteractionEnabled = state;
    }
}
@end
