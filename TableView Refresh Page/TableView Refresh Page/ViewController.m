//
//  ViewController.m
//  TableView Refresh Page
//
//  Created by Juda Cossa on 19/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UITableView * tableView;
    NSMutableArray<NSDate*> * dates;
    UIRefreshControl * refreshControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dates = [[NSMutableArray alloc] init];
    [dates addObject:[NSDate date]] ;
    
    
    tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"identifier"];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:NSSelectorFromString(@"handleRefresh:") forControlEvents:UIControlEventValueChanged];
    [tableView addSubview:refreshControl];
    
}

-(void)handleRefresh:(UIRefreshControl*)sender{
    
    dispatch_time_t poptime = (DISPATCH_TIME_NOW, NSEC_PER_SEC * 2);
    dispatch_after (poptime, dispatch_get_main_queue(), ^{
        [dates addObject:[NSDate date]];
        //[tableView reloadData];//refresh of all data
        [refreshControl endRefreshing];
        //refresh from a specific row, good for system runtime
        NSIndexPath * indexPathOfNewRow = [NSIndexPath indexPathForRow:dates.count - 1 inSection:0];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPathOfNewRow, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    });
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dates.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    NSDate * date = dates[indexPath.row];
    
    cell.textLabel.text = [date description];
    
    return cell;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
