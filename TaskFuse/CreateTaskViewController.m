//
//  CreateTaskViewController.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-25.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#define TITLE_CELL_SECTION 0
#define FREQUENCY_CELL_SECTION 1

#import "CreateTaskViewController.h"
#import "TaskExpiryTableViewCell.h"
#import "Task.h"
#import "TaskTitleTableViewCell.h"
#import "DateHelper.h"
#import "ExpiryDurations.h"
#import "TaskManager.h"

//added to test sourcetree
@interface CreateTaskViewController ()
{
    BOOL isEditing;
}

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation CreateTaskViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = isEditing ? @"Edit Task" : @"New Task";
    [self styleDeleteButton];
    [self styleSaveButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if (isEditing)
    {
        [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    if (isEditing)
    {
        [self populateFieldsWithTaskBeingEdited];
        
        NSIndexPath *frequencyIndex = [NSIndexPath indexPathForRow:0 inSection:1];
        TaskExpiryTableViewCell *frequencyCell = [self.tableView cellForRowAtIndexPath:frequencyIndex];
        frequencyCell.taskExpirySegmentedControl.enabled = NO;
    }
}

#pragma mark - IBActions

- (IBAction)deleteButtonPressed:(UIButton *)sender
{
    if (isEditing)
    {
        [self deleteTask];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    else
    {
        [self cancelTask];
    }
}

- (IBAction)saveButtonPressed:(id)sender
{
    if(isEditing)
    {
        [self updateTask];
    }
    
    else
    {
        [self saveNewTask];
    }
}

#pragma mark - Public

- (void)setIsEditing:(BOOL)isItEditing
{
    isEditing = isItEditing;
}

- (BOOL)isEditing
{
    return isEditing;
}

#pragma mark - Private

- (void)deleteTask
{
    [[TaskManager sharedTaskManager]deleteTask:self.taskBeingEdited];
}

- (void)cancelTask
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)updateTask
{
    Task *task = [self taskFromInputFields];
    [[TaskManager sharedTaskManager]updateSavedTask:self.taskBeingEdited withNewTaskData:task];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)saveNewTask
{
    Task *task = [self taskFromInputFields];
    [[TaskManager sharedTaskManager]addTask:task];
    NSLog(@"%@", task.frequency);
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)populateFieldsWithTaskBeingEdited
{
    NSIndexPath *titleIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    TaskTitleTableViewCell *titleCell = [self.tableView cellForRowAtIndexPath:titleIndex];
    titleCell.taskTitleTextField.text = [[self taskBeingEdited]valueForKey:@"title"];
    
    NSIndexPath *frequencyIndex = [NSIndexPath indexPathForRow:0 inSection:1];
    TaskExpiryTableViewCell *frequencyCell = [self.tableView cellForRowAtIndexPath:frequencyIndex];
    NSNumber *frequency = [self.taskBeingEdited valueForKey:@"frequency"];
    frequencyCell.taskFrequencyTextField.text = [NSString stringWithFormat:@"%@",frequency];
    
    [UIView animateWithDuration:0.75 animations:^{
       [frequencyCell.frequencySlider setValue:[frequency intValue] animated:YES];
    }];
}
- (Task *)taskFromInputFields
{
    //WE NEED DATA VALIDATION HERE
    
    NSString *title;
    NSDate *now = [[NSDate alloc]init];
    NSDate *expiry;
    NSNumber *frequency;
    
    NSIndexPath *titleIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    TaskTitleTableViewCell *titleCell = [self.tableView cellForRowAtIndexPath:titleIndex];
    title = titleCell.title;
    
    NSIndexPath *frequencyIndex = [NSIndexPath indexPathForRow:0 inSection:1];
    TaskExpiryTableViewCell *frequencyCell = [self.tableView cellForRowAtIndexPath:frequencyIndex];
    ExpiryDurations duration = frequencyCell.segmentSelected;
    expiry = [DateHelper expiryFromDate:now afterDuration:duration];
    frequency = @([frequencyCell.taskFrequencyTextField.text intValue]);
    
    Task *task = [[Task alloc]initWithTitle:title
                                  startDate:now
                                 expiryDate:expiry
                                  frequency:frequency];
    return task;
}

- (void)styleSaveButton
{
    [[self.deleteButton layer] setBorderColor:[[UIColor redColor] CGColor]];
    [[self.deleteButton layer] setCornerRadius: 5.0];
    [[self.deleteButton layer] setBorderWidth: 0.5];
}

- (void)styleDeleteButton
{
    [[self.saveButton layer] setBorderColor:[[UIColor colorWithRed:0/255.0 green:180/255.0 blue:64/255.0 alpha:1.0] CGColor]];
    [[self.saveButton layer] setCornerRadius: 5.0];
    [[self.saveButton layer] setBorderWidth: 0.5];
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
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    TaskExpiryTableViewCell *expiryCell;
    TaskTitleTableViewCell *titleCell;
    
    switch (indexPath.section) {
        case 0:
            return titleCell = [tableView dequeueReusableCellWithIdentifier:@"taskTitleCell"
                                                               forIndexPath:indexPath];
        case 1:
            return expiryCell = [tableView dequeueReusableCellWithIdentifier:@"taskFrequencyCell"
                                                                forIndexPath:indexPath];
        default:
            break;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Task Title";
            break;
        case 1:
            return @"Frequency";
        default:
            return @"";
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        return 152;
    }
    
    return 44;
}

@end
