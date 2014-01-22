//
//  TreeViewController.m
//  TQTableViewDemo
//
//  Created by BruceZCQ on 14-1-22.
//  Copyright (c) 2014年 BruceZCQ. All rights reserved.
//

#import "TreeViewController.h"
#import "TQMultistageTableView+Loading.h"

@interface TreeViewController ()
{
    NSMutableArray *_orders ;
}
@end

@implementation TreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView = [[TQMultistageTableView alloc] initWithParentController:self];
//    _tableView.cellAnimation = UIViewContentModeBottom;
    _tableView.cellAnimation = UITableViewRowAnimationAutomatic;
    
    [self.view addSubview:_tableView];
    
    
    
    _orders = [NSMutableArray arrayWithCapacity:0];
    [_tableView loadData];
    
}

- (void)initData
{

    int i = 0;
    while (1) {
        i++;
        if (i == 15) {
            break;
        }
    }
}

#pragma mark - TQTableViewDataSource

- (NSInteger)mTableView:(TQMultistageTableView *)mTableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)mTableView:(TQMultistageTableView *)mTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TQMultistageTableViewCell";
    UITableViewCell *cell = [mTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds] ;
    view.layer.backgroundColor  = [UIColor colorWithRed:246/255.0 green:213/255.0 blue:105/255.0 alpha:1].CGColor;
    view.layer.masksToBounds    = YES;
    view.layer.borderWidth      = 0.5;
    view.layer.borderColor      = [UIColor colorWithRed:250/255.0 green:77/255.0 blue:83/255.0 alpha:1].CGColor;
    
    cell.backgroundView = view;
    cell.textLabel.text = @"Cell";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)loadData
{
    if (_orders && _orders.count != 0) {
        [_orders removeAllObjects];
    }
    int i = 0;
    while (1) {
       // sleep(100);
        i++;
        if (i == 1000000000) {
            break;
        }
    }
    [self initData];
    return 10;
}

- (NSInteger)loadMoreData
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)mTableView
{
    return 20;
}

#pragma mark - Table view delegate

- (CGFloat)mTableView:(TQMultistageTableView *)mTableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)mTableView:(TQMultistageTableView *)mTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (CGFloat)mTableView:(TQMultistageTableView *)mTableView heightForAtomAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UIView *)mTableView:(TQMultistageTableView *)mTableView viewForHeaderInSection:(NSInteger)section;
{
    UIView *header = [[UIView alloc] init];
    
    header.layer.backgroundColor    = [UIColor colorWithRed:218/255.0 green:249/255.0 blue:255/255.0 alpha:1].CGColor;
    header.layer.masksToBounds      = YES;
    header.layer.borderWidth        = 0.5;
    header.layer.borderColor        = [UIColor colorWithRed:179/255.0 green:143/255.0 blue:195/255.0 alpha:1].CGColor;
    return header;
}

- (void)mTableView:(TQMultistageTableView *)mTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRow ----%d",indexPath.row);
}

#pragma mark - Header Open Or Close

- (void)mTableView:(TQMultistageTableView *)mTableView willOpenHeaderAtSection:(NSInteger)section
{
    NSLog(@"Open Header ----%d",section);
}

- (void)mTableView:(TQMultistageTableView *)mTableView willCloseHeaderAtSection:(NSInteger)section
{
    NSLog(@"Close Header ---%d",section);
}

#pragma mark - Row Open Or Close

- (void)mTableView:(TQMultistageTableView *)mTableView willOpenRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Open Row ----%d",indexPath.row);
}

- (void)mTableView:(TQMultistageTableView *)mTableView willCloseRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Close Row ----%d",indexPath.row);
}

@end
