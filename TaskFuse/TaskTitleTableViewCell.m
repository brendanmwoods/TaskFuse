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
@property (weak, nonatomic) IBOutlet UITextField *taskTitleTextField;

@end



@implementation TaskTitleTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
