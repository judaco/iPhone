//
//  ViewController.m
//  Background Fetch
//
//  Created by Juda Cossa on 27/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "NewsItem.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController
{
    BOOL mustReloadData;
    NSMutableArray<NewsItem*> *newsItems;
    UITableView * tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    mustReloadData = NO;
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    newsItems = [appDelegate getNews];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"handleNewsItem:") name:@"newNewsItem" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"handleBroughtToForeground:") name:@"broughtToForeground" object:nil];
    
    tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

-(void)mivzak{
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return newsItems.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"identifier"];
    }
    cell.textLabel.text = newsItems[indexPath.row].text;
    cell.detailTextLabel.text = [newsItems[indexPath.row].date description];
    return cell;
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
-(void)handleNewsItem:(NSNotification*)sender{
    NSLog(@"New news item");
    if ([self isBeingPresented]) {
        [tableView reloadData];
    }else{
        mustReloadData = YES;
    }
}
-(void)handleBroughtToForeground:(NSNotification*)sender{
    NSLog(@"Brought to foreground");
    if (mustReloadData) {
        [tableView reloadData];
        mustReloadData = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
