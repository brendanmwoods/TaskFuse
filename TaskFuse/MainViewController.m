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
#import "MainTaskTableViewCell.h"
#import "DateHelper.h"

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
        }
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TaskManager *sharedTaskManager = [TaskManager sharedTaskManager];
    return [sharedTaskManager.savedTasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainTaskCell"] ;

    TaskManager *sharedManager = [TaskManager sharedTaskManager];
    NSManagedObject *task = [sharedManager savedTasks][indexPath.row];
    
    cell.titleLabel.text = [task valueForKey:@"title"];
    
    NSDate *date = [task valueForKey:@"expiryDate"];

    cell.expiryLabel.text = [DateHelper formatDate:date];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Your Tasks";
    }
    
    else
    {
        return @"";
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"taskDetailsSegue" sender:indexPath];
}

@end
