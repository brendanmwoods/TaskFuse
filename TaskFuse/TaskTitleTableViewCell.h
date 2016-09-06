//
//  TaskTitleTableViewCell.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-16.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskTitleTableViewCell : UITableViewCell


@property (strong, nonatomic)NSString *title;

@property (weak, nonatomic) IBOutlet UITextField *taskTitleTextField;

@end
