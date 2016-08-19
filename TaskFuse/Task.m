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


@end

@implementation Task

#pragma mark - Public

- (instancetype)initWithTitle:(NSString *)taskTitle startDate:(NSDate *)start expiryDate:(NSDate *)expiry
{
    self = [super init];
    
    if(self)
    {
        _taskTitle = taskTitle;
        _startDate = start;
        _expiryDate = expiry;
    }
    return self;
}

- (NSString *)taskTitle
{
    if (!_taskTitle)
    {
        _taskTitle = @"Untitled";
    }
    return _taskTitle;
}

@end
