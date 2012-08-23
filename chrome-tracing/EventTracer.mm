//
//  EventTracer.m
//  CoreAR
//
//  Created by John Sietsma on 22/08/12.
//  Copyright (c) 2012 Dekko. All rights reserved.
//

#import "EventTracer.h"

#import "event_trace.h"

@implementation EventTracer

+ (EventTracer *)sharedInstance {
    static EventTracer *instance = nil;
    if (instance == nil) instance = [[EventTracer alloc] init];
    return instance;
}

-(void) StartTracing {
    isTracing = true;
    TRACE_EVENT_BEGIN();    
}

-(void) StopTracing {
    TRACE_EVENT_FINISH();
    isTracing = false;
}

-(void) LogMessage:(const char*)pMessage {
    @synchronized(self) {
        if( !isTracing ) return;
        NSData* data = [NSData dataWithBytes:(void*)pMessage length:strlen(pMessage)];
        [fileLogger logData:data];
        [fileLogger logData:[NSData dataWithBytes:"\n" length:1]];
    }
}

- (id) init {
    if (self == [super init]) {
        isTracing = false;
        fileLogger = [[FileLogger alloc] init:@"event-trace.json"];
    }
    return self;
}

@end

namespace event_trace
{
void OutputCallback (const char* pMessage) { 
    [[EventTracer sharedInstance] LogMessage:pMessage];
}
void BufferFullCallback() {
    TRACE_EVENT_FLUSH_LOG(); 
}
};

extern "C" {
    void StartTracing() {
        [[EventTracer sharedInstance] StartTracing];
    }
    
    void StopTracing() {
        [[EventTracer sharedInstance] StopTracing];
    }    
}