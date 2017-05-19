//
//  ViewController.m
//  TableView Header and Footer
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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [tableView registerClass: UITableViewCell.class forCellReuseIdentifier:@"identifier"];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Section %li Row %li", indexPath.section, indexPath.row];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(UILabel *) labelWithTitle:(NSString *)title{
    UILabel * label = [[UILabel alloc] init];
    label.text = title;
    label.backgroundColor = [UIColor greenColor];
    [label sizeToFit];
    return label;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [self labelWithTitle:[NSString stringWithFormat:@"Section %li Header", section]];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [self labelWithTitle:[NSString stringWithFormat:@"Section %li Footer", section]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
