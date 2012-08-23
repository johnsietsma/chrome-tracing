#import "FileLogger.h"

@implementation FileLogger
- (void)dealloc {
    [logFile release]; logFile = nil;
    [super dealloc];
}

- (id) init:(NSString*)fileName {
    if (self == [super init]) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:filePath]) {
            [fileManager createFileAtPath:filePath
                                 contents:nil
                               attributes:nil];
        }
        logFile = [[NSFileHandle fileHandleForWritingAtPath:filePath] retain];
    }
    
    return self;
}

- (void)logString:(NSString *)logMsg {
    [self logData:[logMsg dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)logData:(NSData *)logData {
    @synchronized(self) {
        [logFile writeData:logData];
        [logFile synchronizeFile];
    }    
}
@end

