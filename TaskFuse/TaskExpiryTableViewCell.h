//
//  TaskExpiryTableViewCell.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-18.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskExpiryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISlider *frequencySlider;
@property (weak, nonatomic) IBOutlet UITextField *taskFrequencyTextField;

@property (nonatomic,assign)int segmentSelected;


@end
