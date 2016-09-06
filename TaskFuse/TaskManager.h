//
//  TaskManager.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-17.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
#import <CoreData/CoreData.h>

//A singleton for retrieving and storing tasks.
@interface TaskManager : NSObject


@property (strong, nonatomic) NSMutableArray *savedTasks;

+ (TaskManager *)sharedTaskManager;

- (void)deleteTask:(NSManagedObject *)task;
- (void)addTask:(Task *)task;
- (void)updateSavedTask:(NSManagedObject *)object withNewTaskData:(Task *)task;

@end
