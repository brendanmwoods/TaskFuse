//
//  DetailTaskTitleTableViewCell.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-17.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "DetailTaskTitleTableViewCell.h"
@interface DetailTaskTitleTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation DetailTaskTitleTableViewCell

#pragma mark - Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public
- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

@end
