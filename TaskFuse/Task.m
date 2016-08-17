//
//  Task.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-16.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "Task.h"

@interface Task()

#pragma mark - Properties
@property (nonatomic, strong) NSString *taskTitle;

@end

@implementation Task

#pragma mark - Private

- (NSString *)taskTitle
{
    if (!_taskTitle)
    {
        _taskTitle = @"Untitled";
    }
    return _taskTitle;
}

@end
