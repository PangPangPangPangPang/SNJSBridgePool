//
//  SNJSFileManager.m
//  SNJSBridge
//
//  Created by Max on 16/4/10.
//  Copyright © 2016年 Max. All rights reserved.
//

#import "SNJSFileManager.h"

static SNJSFileManager *_manager;
@implementation SNJSFileManager {
    NSMutableDictionary *_sources;
    dispatch_semaphore_t _semaphore;
}

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [SNJSFileManager new];
    });
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sources = [NSMutableDictionary new];
        _semaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)cacheFile:(NSString *)file
          content:(NSString *)content {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [_sources setValue:content forKey:file];
    dispatch_semaphore_signal(_semaphore);
}

- (void)removeFile:(NSString *)file {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [_sources setValue:nil forKey:file];
    dispatch_semaphore_signal(_semaphore);
}

- (NSString *)contentForFileName:(NSString *)file {

    if ([self containFile:file]) {
        return [_sources valueForKey:@"file"];
    }
    NSString *fileString = [NSString stringWithContentsOfFile:file
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
    [_sources setValue:fileString forKey:file];
    return fileString;
}

- (BOOL)containFile:(NSString *)path {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    if ([_sources valueForKey:@"path"]) {
        dispatch_semaphore_signal(_semaphore);
        return YES;
    }
    dispatch_semaphore_signal(_semaphore);
    return NO;
}

- (void)cleanCache {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [_sources removeAllObjects];
    dispatch_semaphore_signal(_semaphore);
}

@end
