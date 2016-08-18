//
//  CreateTaskTableViewController.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-16.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "CreateTaskTableViewController.h"
#import "TaskTitleTableViewCell.h"
#import "TaskManager.h"
#import "TaskExpiryTableViewCell.h"
#import "ExpiryDurations.h"
#import "DateHelper.h"

static int const TITLE_SECTION = 0;
static int const TITLE_ROW = 0;
static int const SUBMIT_BUTTON_SECTION = 2;
//static int const SUBMIT_BUTTON_ROW = 1;

@interface CreateTaskTableViewController()

#pragma mark - Properties
@property (strong,nonatomic) NSString *taskTitle;

@end

@implementation CreateTaskTableViewController

#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"New Task";
}

#pragma mark - IBActions

- (IBAction)submitTaskButtonPressed:(UIButton *)sender
{
    ExpiryDurations duration = Week;
    
    NSDate *now = [DateHelper currentDate];
    NSDate *expiry = [DateHelper expiryFromDate:now afterDuration:duration];
    NSLog(@"now : %@",now);
    NSLog(@"one week later : %@",expiry);
    //create a Task with the current details
    //Task *task = [[Task alloc]init];
    
    
    
    TaskManager *sharedTaskManager = [TaskManager sharedTaskManager];
    [sharedTaskManager addTaskWithTitle:[self taskTitle]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}



#pragma mark - Public

#pragma mark - Private

- (NSString *)taskTitle
{
    NSIndexPath *titlePath = [NSIndexPath indexPathForRow:TITLE_ROW inSection:TITLE_SECTION];
    TaskTitleTableViewCell *titleCell = [self.tableView cellForRowAtIndexPath:titlePath];
    return titleCell.title;
}

//- (NSDate *)calculateExpiryDate:(NSDate *)
//{
//    return nil;
//}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"taskTitleCell" forIndexPath:indexPath];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"taskExpiryCell" forIndexPath:indexPath];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"taskSubmitCell" forIndexPath:indexPath];
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
    
    if (section == 1)
    {
        return @"Task Duration";
    }
    else
    {
        return @"Save";
    }
}


@end
