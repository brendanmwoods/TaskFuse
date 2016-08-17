//
//  TaskManager.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-17.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

//A singleton for retrieving and storing tasks.
@interface TaskManager : NSObject

@property (strong, nonatomic, readonly)NSMutableArray *tasks; //of Task

+ (TaskManager *)sharedTaskManager;

- (void)addTaskWithTitle:(NSString *)newTask;

@end
