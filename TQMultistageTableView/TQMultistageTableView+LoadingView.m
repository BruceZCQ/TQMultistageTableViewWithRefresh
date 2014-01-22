//
//  TQMultistageTableView+LoadingView.m
//  PocketShop
//
//  Created by BruceZCQ on 14-1-22.
//  Copyright (c) 2014年 BruceZCQ. All rights reserved.
//

#import "TQMultistageTableView+LoadingView.h"

@implementation TQMultistageTableView (LoadingView)

- (UIView *)loadingView
{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"正在加载数据...";
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (UIView *)noDataView
{
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"没有更多数据";
    
    label.layer.masksToBounds      = YES;
    label.layer.borderWidth        = 0.3;
    label.layer.borderColor        = [UIColor colorWithRed:179/255.0 green:143/255.0 blue:195/255.0 alpha:1].CGColor;
    
    return label;
}

@end
