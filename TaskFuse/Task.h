//
//  Task.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-16.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, strong)NSString *taskTitle;
@property (nonatomic, strong)NSDate *startDate;
@property (nonatomic, strong)NSDate *expiryDate;
@property (nonatomic, strong)NSNumber *frequency;

- (instancetype)initWithTitle:(NSString *)taskTitle
                    startDate:(NSDate *)start
                   expiryDate:(NSDate*)expiry
                    frequency:(NSNumber *)frequency;

@end
