//
//  TaskSubmitTableViewCell.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-17.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "TaskSubmitTableViewCell.h"


@interface TaskSubmitTableViewCell()

#pragma mark - IBOutlets
@property (weak, nonatomic) IBOutlet UIButton *taskSubmitButton;

@end

@implementation TaskSubmitTableViewCell

#pragma mark - Lifecycle
- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
