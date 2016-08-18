//
//  TaskExpiryTableViewCell.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-18.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "TaskExpiryTableViewCell.h"

@interface TaskExpiryTableViewCell()
@property (weak, nonatomic) IBOutlet UISegmentedControl *taskExpirySegmentedControl;


@end

@implementation TaskExpiryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
