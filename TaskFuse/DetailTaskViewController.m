//
//  DetailTaskViewController.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-25.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "DetailTaskViewController.h"
#import "DetailTaskTitleTableViewCell.h"
#import "Constants.h"

@interface DetailTaskViewController ()

#pragma  mark - IBOutlets

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *taskPerformedButton;

@end

@implementation DetailTaskViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@", [self.task valueForKey:@"title"]];
    [self styleTaskPerformedButton];
}

#pragma mark - IBActions

- (IBAction)deleteButtonPressed:(UIButton *)sender
{
    
}

- (IBAction)saveButtonPressed:(UIButton *)sender
{
    
}

#pragma mark - Private

- (void)styleTaskPerformedButton
{
    [[self.taskPerformedButton layer] setBorderColor:[[UIColor colorWithRed:0/255.0 green:180/255.0 blue:64/255.0 alpha:1.0] CGColor]];
    [[self.taskPerformedButton layer] setCornerRadius: 5.0];
    [[self.taskPerformedButton layer] setBorderWidth: 0.5];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
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
        case 0:
            myCell = [tableView dequeueReusableCellWithIdentifier:@"detailTaskTitleCell"
                                                     forIndexPath:indexPath];
            [myCell setTitle:[self.task valueForKey:@"title"]];
            return myCell;
        default:
            break;
    }
    
    NSLog(@"SENDING CELL");
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Task Title";
    }
    
    else
    {
        return @"";
    }
}
#pragma mark - UITableViewDelegate

@end
