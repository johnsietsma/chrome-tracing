//
//  EventTracker.h
//  CoreAR
//
//  Created by John Sietsma on 22/08/12.
//  Copyright (c) 2012 Dekko. All rights reserved.
//

#include "FileLogger.h"

@interface EventTracer : NSObject {
    bool isTracing;
    FileLogger* fileLogger;
}
-(void) StartTracing;
-(void) StopTracing;
-(void) LogMessage:(const char*)msg;
+ (EventTracer *)sharedInstance;
@end
