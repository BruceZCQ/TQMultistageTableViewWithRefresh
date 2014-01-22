//
//
//  TQMultistageTableView+InvokeDelegate.h
//  TQTableViewDemo
//
//  Created by BruceZCQ on 14-1-22.
//  Copyright (c) 2014年 BruceZCQ. All rights reserved.
//

#import "TQMultistageTableView.h"
#import "TQMultistageTableViewLoadingConfig.h"

@interface TQMultistageTableView (InvokeDelegate)
- (CGFloat)invoke_heightForHeaderInSection:(NSInteger)section;
- (CGFloat)invoke_heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)invoke_heightForAtomAtIndexPath:(NSIndexPath *)indexPath;
- (UIView *)invoke_viewForHeaderInSection:(NSInteger)section;
- (void)invoke_willOpenHeaderAtSection:(NSInteger)section;
- (void)invoke_willCloseHeaderAtSection:(NSInteger)section;
- (void)invoke_willOpenRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)invoke_willCloseRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)invoke_didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)invoke_numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)invoke_cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)invoke_numberOfSectionsInTableView;
@end
