//
//  MainTaskTableViewCell.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-18.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTaskTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysRemainingLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursRemainingLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesRemainingLabel;

@property (weak, nonatomic) IBOutlet UILabel *daysLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;


@end
