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
#import "UIKit/UIKit.h"
#import <CoreData/CoreData.h>
#import "DetailTaskTableViewController.h"

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    if ([segue.identifier  isEqual: @"taskDetailsSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[DetailTaskTableViewController class]])
        {
            DetailTaskTableViewController *destinationVC = segue.destinationViewController;
            TaskManager *sharedManager = [TaskManager sharedTaskManager];
            destinationVC.task = [sharedManager savedTasks][sender.row];
            NSLog(@"sending %@", [sharedManager savedTasks][sender.row]);
        }
    }
}

#pragma mark - UITableViewDataSource

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TaskManager *sharedTaskManager = [TaskManager sharedTaskManager];
    return [sharedTaskManager.savedTasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskManager *sharedManager = [TaskManager sharedTaskManager];
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    NSManagedObject *task = [sharedManager savedTasks][indexPath.row];
    
    //set table view title to the task label
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [task valueForKey:@"title"]];
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

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"touched row %d", indexPath.row);
    [self performSegueWithIdentifier:@"taskDetailsSegue" sender:indexPath];
}



// In a storyboard-based application, you will often want to do a little preparation before navigation



@end
