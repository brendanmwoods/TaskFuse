//
//  DateHelperTests.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-24.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DateHelper.h"
#import "ExpiryDurations.h"

@interface DateHelperTests : XCTestCase

{
@private
    
    DateHelper *dateHelper;
    ExpiryDurations term;
    NSDate *now;
    NSDate *expiry;
}

@end

@implementation DateHelperTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    now = [[NSDate alloc]init];
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    //[[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCalculateNegativeCountdownValues
{
    NSMutableArray *output = [DateHelper calculateCountdownValues:[NSDate dateWithTimeIntervalSinceNow:-100]];
    XCTAssertNil(output, @"Negative countdown values failed to return nil");
}

- (void)testYearExpiryCalculation
{
    term = Year;
    expiry = [DateHelper expiryFromDate:now afterDuration:term];
    XCTAssertEqualObjects(expiry, [now dateByAddingTimeInterval:31536000],@"Year expiry calculation failed.");
}

- (void)testMonthExpiryCalculation
{
    term = Month;
    expiry = [DateHelper expiryFromDate:now afterDuration:term];
    XCTAssertEqualObjects(expiry, [now dateByAddingTimeInterval:2592000],@"Month expiry failed.");
}

- (void)testWeekExpiryCalculation
{
    term = Week;
    expiry = [DateHelper expiryFromDate:now afterDuration:term];
    XCTAssertEqualObjects(expiry, [now dateByAddingTimeInterval:604800], @"Week expiry failedl");
}

- (void)testDayExpiryCalculation
{
    term = Day;
    expiry = [DateHelper expiryFromDate:now afterDuration:term];
    XCTAssertEqualObjects(expiry, [now dateByAddingTimeInterval:86400], @"Day expiry failedl");
}

@end
