//
//  DateHelper.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-18.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

+ (NSDate *)currentDate
{
    return [[NSDate alloc]init];
}

+ (NSDate *)expiryFromDate:(NSDate *)now afterDuration:(ExpiryDurations)duration
{
    NSDate *expiry;
    
    if (duration == Day)
    {
        expiry = [now dateByAddingTimeInterval:60 * 60 * 24];
    }
    
    else if (duration == Week)
    {
        expiry = [now dateByAddingTimeInterval:60 * 60 * 24 * 7];
    }
    
    else if (duration == Month)
    {
        expiry = [now dateByAddingTimeInterval:60 * 60 * 24 * 30];
    }
    else if (duration == Year)
    {
        expiry = [now dateByAddingTimeInterval:60 * 60 * 24 * 365];
    }
    
    else
    {
        return nil;
        NSLog(@"Incorrect expiry date calculated in DateHelper");
    }
    return expiry;
}

@end
