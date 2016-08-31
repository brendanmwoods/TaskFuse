//
//  CreateTaskViewController.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-25.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface CreateTaskViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) Task *taskBeingEdited;

- (void)setIsEditing:(BOOL)isItEditing;
- (BOOL)isEditing;


@end
