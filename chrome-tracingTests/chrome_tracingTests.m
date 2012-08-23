//
//  chrome_tracingTests.m
//  chrome-tracingTests
//
//  Created by John Sietsma on 23/08/12.
//  Copyright (c) 2012 Dekko. All rights reserved.
//

#import "chrome_tracingTests.h"

#import "EventTracer.h"

@implementation chrome_tracingTests

- (void)setUp
{
    [super setUp];
    
    [[EventTracer sharedInstance] StartTracing];
}

- (void)tearDown
{
    [[EventTracer sharedInstance] StartTracing];
    
    [super tearDown];
}

- (void)testExample
{
    STFail(@"Unit tests are not implemented yet in chrome-tracingTests");
}

@end
