//
//  MainViewController.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-16.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "MainViewController.h"
#import "Task.h"
#import "TaskManager.h"

@interface MainViewController ()

#pragma mark - Properties

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UIButton *createTaskButton;
@property (weak, nonatomic) IBOutlet UITableView *tasksTableView;

@end

@implementation MainViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.tasksTableView reloadData];
}

#pragma mark - IBActions

#pragma mark - Public

#pragma mark - Private

#pragma mark - UITableViewDataSource

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TaskManager *sharedTaskManager = [TaskManager sharedTaskManager];
    return [sharedTaskManager.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskManager *sharedManager = [TaskManager sharedTaskManager];
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    Task *task = (Task *)[sharedManager tasks][indexPath.row];
    //set table view title to the task label
    cell.textLabel.text = [NSString stringWithFormat:@"%@",task.taskTitle];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Your Tasks";
    }
    else {
        return @"";
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
