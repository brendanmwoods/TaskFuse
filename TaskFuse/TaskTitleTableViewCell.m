//
//  TaskTitleTableViewCell.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-16.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "TaskTitleTableViewCell.h"

@interface TaskTitleTableViewCell()

#pragma mark - IBOutlets



@end

@implementation TaskTitleTableViewCell

#pragma mark - Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - public

- (NSString *)title
{
    return self.taskTitleTextField.text;
}
@end
