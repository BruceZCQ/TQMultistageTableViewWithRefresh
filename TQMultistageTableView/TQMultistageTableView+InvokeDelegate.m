//
//
//  TQMultistageTableView+InvokeDelegate.m
//  TQTableViewDemo
//
//  Created by BruceZCQ on 14-1-22.
//  Copyright (c) 2014年 BruceZCQ. All rights reserved.
//

#import "TQMultistageTableView+InvokeDelegate.h"


static const CGFloat kDefultHeightForRow    = 44.0f;
static const CGFloat kDefultHeightForAtom   = 44.0f;

@implementation TQMultistageTableView (InvokeDelegate)

#pragma mark - Invoke Delegate

- (CGFloat)invoke_heightForHeaderInSection:(NSInteger)section
{
    NSInteger h = 0;
    if (self.delegate && [self.delegate respondsToSelector:@selector(mTableView: heightForHeaderInSection:)])
    {
        h = [self.delegate mTableView:self heightForHeaderInSection:section];
    }
    return h;
}

- (CGFloat)invoke_heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = kDefultHeightForRow;
    if (self.delegate && [self.delegate respondsToSelector:@selector(mTableView: heightForRowAtIndexPath:)])
    {
        h = [self.delegate mTableView:self heightForRowAtIndexPath:indexPath];
    }
    return h;
}

- (CGFloat)invoke_heightForAtomAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = kDefultHeightForAtom;
    if (self.delegate && [self.delegate respondsToSelector:@selector(mTableView: heightForAtomAtIndexPath:)])
    {
        h = [self.delegate mTableView:self heightForAtomAtIndexPath:indexPath];
    }
    return h;
}

- (UIView *)invoke_viewForHeaderInSection:(NSInteger)section
{
    UIView *view = nil;
    
    //total section count
    
    NSInteger sectionCnt = [self invoke_numberOfSectionsInTableView];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(mTableView: viewForHeaderInSection:)] && section < sectionCnt-1)
    {
        view = [self.delegate mTableView:self viewForHeaderInSection:section];
    }
    return view;
}

- (void)invoke_willOpenHeaderAtSection:(NSInteger)section
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mTableView: willOpenHeaderAtSection:)])
    {
        [self.delegate mTableView:self willOpenHeaderAtSection:section];
    }
}

- (void)invoke_willCloseHeaderAtSection:(NSInteger)section
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mTableView: willCloseHeaderAtSection:)])
    {
        [self.delegate mTableView:self willCloseHeaderAtSection:section];
    }
}

- (void)invoke_willOpenRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mTableView: willOpenHeaderAtSection:)])
    {
        [self.delegate mTableView:self willOpenRowAtIndexPath:indexPath];
    }
}

- (void)invoke_willCloseRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mTableView: willCloseRowAtIndexPath:)])
    {
        [self.delegate mTableView:self willCloseRowAtIndexPath:indexPath];
    }
}

- (void)invoke_didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mTableView: didSelectRowAtIndexPath:)])
    {
        [self.delegate mTableView:self didSelectRowAtIndexPath:indexPath];
    }
}

#pragma mark - Invoke DataSource

- (NSInteger)invoke_numberOfRowsInSection:(NSInteger)section
{
    NSInteger n = 0;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(mTableView: numberOfRowsInSection:)])
    {
        n = [self.dataSource mTableView:self numberOfRowsInSection:section];
    }
    return n;
}

- (UITableViewCell *)invoke_cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(mTableView: cellForRowAtIndexPath:)])
    {
        cell = [self.dataSource mTableView:self cellForRowAtIndexPath:indexPath];
    }
    return cell;
}

- (NSInteger)invoke_numberOfSectionsInTableView
{
    NSInteger n = 0;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)])
    {
        n = [self.dataSource numberOfSectionsInTableView:self];
    }
    //add loading or Prompt header
    n += 1;
    return n;
}



@end
