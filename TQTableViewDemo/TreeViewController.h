//
//  TreeViewController.h
//  TQTableViewDemo
//
//  Created by BruceZCQ on 14-1-22.
//  Copyright (c) 2014年 BruceZCQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQMultistageTableView.h"

@interface TreeViewController : UIViewController<TQTableViewDataSource,TQTableViewDelegate>
{
    TQMultistageTableView *_tableView;;
}
@end
