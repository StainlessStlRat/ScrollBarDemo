//
//  ViewController.m
//  ScrollDemo
//
//  Created by Holzhauer, James on 10/18/18.
//  Copyright © 2018 temp. All rights reserved.
//

#import "ViewController.h"

#import "AMScrollingNavbar-Swift.h"

@interface ViewController () <UITableViewDataSource>
    @property (weak, nonatomic) IBOutlet UIView *oversizedToolbar;
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"ScrollBar Demo"];
}
    
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    BOOL useFollower = YES;
    NavigationBarFollower *follower = [[NavigationBarFollower alloc] initWithView:_oversizedToolbar direction:NavigationBarFollowerCollapseDirectionScrollUp];
    NSArray *followers = useFollower ? @[follower] : nil;
    [(ScrollingNavigationController *)self.navigationController followScrollView:self.tableView delay:0 scrollSpeedFactor:1 collapseDirection:NavigationBarCollapseDirectionScrollDown followers:followers];
}
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    UILabel *label = [cell viewWithTag:1];
    [label setText:[NSString stringWithFormat:@"Cell %ld", (long)indexPath.row]];
    return cell;
}



@end
