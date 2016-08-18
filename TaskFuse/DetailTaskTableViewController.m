//
//  DetailTaskTableViewController.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-17.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "DetailTaskTableViewController.h"
#import "DetailTaskTitleTableViewCell.h"
#import "TaskManager.h"

static int const TITLE_SECTION = 0;
//static int const TITLE_ROW = 0;
static int const DELETE_SECTION = 1;
//static int const DELETE_ROW = 1;

@interface DetailTaskTableViewController ()

@end

@implementation DetailTaskTableViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@", [self.task valueForKey:@"title"]];
    
}

#pragma mark = IBActions

- (IBAction)deleteButtonPushed:(UIButton *)sender
{
    TaskManager *sharedManager = [TaskManager sharedTaskManager];
    [sharedManager deleteTask:self.task];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    DetailTaskTitleTableViewCell *myCell;
    
    switch (indexPath.section)
    {
        case TITLE_SECTION:
            myCell = [tableView dequeueReusableCellWithIdentifier:@"detailTaskTitleCell"
                                                     forIndexPath:indexPath];
            [myCell setTitle:[self.task valueForKey:@"title"]];
            return myCell;
        case DELETE_SECTION:
            cell = [tableView dequeueReusableCellWithIdentifier:@"detailTaskDeleteCell"
                                                     forIndexPath:indexPath];
            return cell;
        default:
            break;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == TITLE_SECTION)
    {
        return @"Task Title";
    }
    
    else
    {
        return @"";
    }
}


@end
