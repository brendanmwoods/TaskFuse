//
//  CreateTaskViewController.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-25.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "CreateTaskViewController.h"
#import "TaskExpiryTableViewCell.h"

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"New Task";
    [self styleDeleteButton];
    [self styleSaveButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)deleteButtonPressed:(UIButton *)sender
{
    
}


- (IBAction)saveButtonPressed:(UIButton *)sender
{
    
}

#pragma mark - Public

- (void)setIsEditing:(BOOL)isItEditing
{
    self.isEditing = isItEditing;
}

- (BOOL)isEditing
{
    return isEditing;
}

#pragma mark - Private

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

#pragma mark - UITableViewDelegate

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
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"taskTitleCell" forIndexPath:indexPath];
        case 1:
            return expiryCell = [tableView dequeueReusableCellWithIdentifier:@"taskFrequencyCell" forIndexPath:indexPath];
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
        NSLog(@"got here");
        return 132;
    }
    
    return 44;
}

@end
