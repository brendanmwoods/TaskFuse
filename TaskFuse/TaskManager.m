//
//  TaskManager.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-17.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "TaskManager.h"

@implementation TaskManager

#pragma mark - Properties
@synthesize tasks = _tasks;

#pragma mark - Public
- (NSMutableArray *)tasks
{
    if(!_tasks)
    {
        _tasks = [[NSMutableArray alloc]init];
    }
    return _tasks;
}

//get the singleton shared task manager
+ (TaskManager *)sharedTaskManager
{
    static TaskManager *sharedTaskManager = nil;
    
    if(sharedTaskManager == nil)
    {
        sharedTaskManager = [[TaskManager alloc]init];
    }
    return sharedTaskManager;
}

- (void)addTaskWithTitle:(NSString *)newTaskTitle
{
    [self.tasks addObject:[[Task alloc]initWithTitle:newTaskTitle]];
    NSLog(@"%d", [self.tasks count]);
    NSLog(@"adding %@",newTaskTitle);
    
}

@end
