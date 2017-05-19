//
//  ViewController.m
//  UITableView
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
    NSMutableArray<NSString*> * animals;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    animals = [[NSMutableArray alloc] init];
    for (int i = 1; i <100 ; i++) {
        [animals addObject:[NSString stringWithFormat:@"animal %i", i]];
    }
    
    tableView = [[UITableView alloc] initWithFrame: self.view.frame style:UITableViewStylePlain];
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"identifier"];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return animals.count;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [animals removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft];
    }
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:indexPath];
    cell.textLabel.text = animals[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
