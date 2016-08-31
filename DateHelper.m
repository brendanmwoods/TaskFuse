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

+ (NSMutableArray *)calculateCountdownValues:(NSDate *)expiry
{
    NSTimeInterval secondsRemainingDouble = [expiry timeIntervalSinceNow];
    NSMutableArray *daysHoursMinutesRemaining = [[NSMutableArray alloc]init];
    
    if (secondsRemainingDouble < 0)
    {
        return nil;
    }
    int secondsRemaining = secondsRemainingDouble;
    int daysRemaining = secondsRemaining / (60 * 60 * 24);
    int daysRemainder = secondsRemaining % (60 * 60 * 24);
    int hoursRemaining = daysRemainder / (60 * 60);
    int hoursRemainder = daysRemainder % (60 * 60);
    int minutesRemaining = hoursRemainder / (60);
    
    id daysId = [NSNumber numberWithInt:daysRemaining];
    id hoursId = [NSNumber numberWithInt:hoursRemaining];
    id minutesId = [NSNumber numberWithInt:minutesRemaining];
    
    [daysHoursMinutesRemaining addObject:daysId];
    [daysHoursMinutesRemaining addObject:hoursId];
    [daysHoursMinutesRemaining addObject:minutesId];
    
    return daysHoursMinutesRemaining;
}

@end
