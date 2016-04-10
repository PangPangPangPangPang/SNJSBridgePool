//
//  SNJSBridge.m
//  SNJSBridge
//
//  Created by Max on 16/4/9.
//  Copyright © 2016年 Max. All rights reserved.
//

#import "SNJSBridge.h"
#import "SNJSFileManager.h"

@implementation SNJSBridge {
    JSContext *_context;
    JSVirtualMachine *_virtualMachine;
    NSMutableDictionary *_loadFiles;
}

- (instancetype)initWithVirtualMachine:(JSVirtualMachine *)machine {
    self = [super init];
    if (self) {
        _virtualMachine = machine;
        _context = [[JSContext alloc] initWithVirtualMachine:_virtualMachine];
        _loadFiles = [NSMutableDictionary new];
    }
    return self;
}

- (instancetype)init
{
    self = [self initWithVirtualMachine:[JSVirtualMachine new]];
    if (self) {
    }
    return self;
}


- (JSValue *)evaluateScriptFromFile:(NSString *)file
                          func:(NSString *)func
                          args:(NSArray *)args {
    NSString *path = [[NSBundle mainBundle] pathForResource:[file componentsSeparatedByString:@"."][0] ofType:@"js"];
    NSString *fileString = [[SNJSFileManager shareInstance] contentForFileName:path];
    if (![_loadFiles valueForKey:@"file"]) {
        [_loadFiles setValue:fileString forKey:path];
        [_context evaluateScript:fileString];
    }
    JSValue *value =[_context evaluateScript:[self generateFunc:func args:args]];
    return value;
}

- (NSString *)generateFunc:(NSString *)func args:(NSArray *)args {
    NSMutableString *result = [NSMutableString stringWithString:func];
    [result appendString:@"("];
    for (int i = 0; i < args.count; i++) {
        NSString *arg;
        if (i == args.count - 1) {
            arg = [NSString stringWithFormat:@"%@",args[i]];
        }else {
            arg = [NSString stringWithFormat:@"%@,",args[i]];
        }
        [result appendString:arg];
    }
    [result appendString:@")"];
    return result;
}

@end
