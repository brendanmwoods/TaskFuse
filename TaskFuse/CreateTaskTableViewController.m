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


static int const TITLE_SECTION = 0;
static int const TITLE_ROW = 0;
static int const SUBMIT_BUTTON_SECTION = 1;
static int const SUBMIT_BUTTON_ROW = 1;

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
    NSLog(@"Create Task Button Pushed");
    TaskManager *sharedTaskManager = [TaskManager sharedTaskManager];
    
    //get the cell with the title
    
    [sharedTaskManager addTaskWithTitle:[self taskTitle]];
}

#pragma mark - Public

#pragma mark - Private

- (NSString *)taskTitle
{
    NSIndexPath *titlePath = [NSIndexPath indexPathForRow:TITLE_ROW inSection:TITLE_SECTION];
    TaskTitleTableViewCell *titleCell = [self.tableView cellForRowAtIndexPath:titlePath];
    return titleCell.title;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case TITLE_SECTION:
            cell = [tableView dequeueReusableCellWithIdentifier:@"taskTitleCell" forIndexPath:indexPath];
            break;
        case SUBMIT_BUTTON_SECTION:
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
    
    else
    {
        return @"";
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
