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
    
    switch (duration)
    {
        case Day:
            expiry = [now dateByAddingTimeInterval:60 * 60 * 24];
            break;
        case Week:
            expiry = [now dateByAddingTimeInterval:60 * 60 * 24 * 7];
            break;
        case Month:
            expiry = [now dateByAddingTimeInterval:60 * 60 * 24 * 30];
            break;
        case Year:
            expiry = [now dateByAddingTimeInterval:60 * 60 * 24 * 365];
            break;
        default:
            break;
    }
    return expiry;
}

+ (NSString *)formatDate:(NSDate *)unformatedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSString *prettyDate = [formatter stringFromDate:unformatedDate];
    NSLog(@"pretty date %@", prettyDate);
    
    return prettyDate;
}

@end
