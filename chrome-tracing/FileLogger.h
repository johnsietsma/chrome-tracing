@interface FileLogger : NSObject {
    NSFileHandle *logFile;
}
- (id)init:(NSString *)fileName;
- (void)logString:(NSString *)logMsg;
- (void)logData:(NSData *)logData;
@end
