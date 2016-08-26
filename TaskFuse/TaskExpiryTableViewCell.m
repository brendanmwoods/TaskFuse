//
//  TaskExpiryTableViewCell.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-18.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "TaskExpiryTableViewCell.h"

@interface TaskExpiryTableViewCell()

#pragma mark - Properties
@property (weak, nonatomic) IBOutlet UISegmentedControl *taskExpirySegmentedControl;


@end

@implementation TaskExpiryTableViewCell

#pragma  mark - Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


#pragma mark - Public

- (int)segmentSelected
{
    
    NSLog(@"is selected");
    _segmentSelected =(int)[self.taskExpirySegmentedControl selectedSegmentIndex];
    NSLog(@"returning %d", _segmentSelected);
    
    return _segmentSelected;
}

@end
