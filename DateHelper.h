//
//  DateHelper.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-18.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpiryDurations.h"


@interface DateHelper : NSObject

+ (NSDate *)currentDate;

+ (NSDate *)expiryFromDate:(NSDate *)now afterDuration:(ExpiryDurations)duration;


@end
