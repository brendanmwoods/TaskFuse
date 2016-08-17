//
//  Task.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-16.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, strong) NSString *taskTitle;

- (instancetype)initWithTitle:(NSString *)taskTitle;

@end
