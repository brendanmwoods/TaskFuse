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
#import <QuartzCore/QuartzCore.h>
#import "DetailTaskViewController.h"
#import "Constants.h"

@interface MainViewController()

#pragma mark - Properties

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UIButton *createTaskButton;
@property (weak, nonatomic) IBOutlet UITableView *tasksTableView;

@end

@implementation MainViewController
{
    TaskManager *sharedManager;
}
#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    sharedManager = [TaskManager sharedTaskManager];
    [self startUIUpdatingTimer];
    [self styleCreateTaskButton];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self.tasksTableView reloadData];
}

#pragma mark - IBActions

#pragma mark - Public

#pragma mark - Private

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    if ([segue.identifier  isEqual: @"taskDetailsSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[DetailTaskViewController class]])
        {
            DetailTaskTableViewController *destinationVC = segue.destinationViewController;
            destinationVC.task = [sharedManager savedTasks][sender.row];
        }
    }
}

- (void)startUIUpdatingTimer
{
    NSTimer *updateUITimer = [NSTimer scheduledTimerWithTimeInterval:10
                                                              target:self
                                                            selector:@selector(updateGui)
                                                            userInfo:nil
                                                             repeats:YES];
    NSLog(@"timer started %@",updateUITimer);
}

- (void)styleCreateTaskButton
{
    [[self.createTaskButton layer] setBorderWidth:0.5];
    [[self.createTaskButton layer] setBorderColor:[[UIColor colorWithRed:0/255.0 green:180/255.0 blue:64/255.0 alpha:1.0]CGColor]];
    [[self.createTaskButton layer] setCornerRadius:5];
}

- (void)updateGui
{
    [self.tasksTableView reloadData];
    NSLog(@"updating UI");
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sharedManager.savedTasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainTaskCell"] ;
    NSManagedObject *task = [sharedManager savedTasks][indexPath.row];
    cell.titleLabel.text = [task valueForKey:@"title"];
    NSDate *date = [task valueForKey:@"expiryDate"];
    NSMutableArray *daysHoursMinutesRemaining = [DateHelper calculateCountdownValues:date];
    
    if (daysHoursMinutesRemaining == nil)
    {
        cell.titleLabel.textColor = [UIColor redColor];
        cell.daysRemainingLabel.hidden = YES;
        cell.hoursRemainingLabel.hidden = YES;
        cell.minutesRemainingLabel.hidden = YES;
        cell.daysLabel.hidden = YES;
        cell.hoursLabel.hidden = YES;
        cell.minutesLabel.hidden = YES;
        return cell;
    }
    cell.daysRemainingLabel.text = [NSString stringWithFormat:@"%@",[daysHoursMinutesRemaining objectAtIndex:0]];
    cell.hoursRemainingLabel.text = [NSString stringWithFormat:@"%@",[daysHoursMinutesRemaining objectAtIndex:1]];
    cell.minutesRemainingLabel.text = [NSString stringWithFormat:@"%@",[daysHoursMinutesRemaining objectAtIndex:2]];
    
    if ([cell.daysRemainingLabel.text isEqualToString:@"0"])
    {
        cell.daysRemainingLabel.hidden = YES;
        cell.daysLabel.hidden = YES;
        if([cell.hoursRemainingLabel.text isEqualToString:@"0"])
        {
            cell.hoursRemainingLabel.hidden = YES;
            cell.hoursLabel.hidden = YES;
        }
        
    }
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
