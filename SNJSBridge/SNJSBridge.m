//
//  SNJSBridge.m
//  SNJSBridge
//
//  Created by Max on 16/4/9.
//  Copyright © 2016年 Max. All rights reserved.
//

#import "SNJSBridge.h"
#import "SNJSFileManager.h"
#import "SNJSCommonFiller.h"

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
        [_context setExceptionHandler:^(JSContext *context, JSValue *exception) {
            NSLog(@"%@ error: %@",context,exception);
        }];
        _loadFiles = [NSMutableDictionary new];
        [SNJSCommonFiller loadCommonMethod:self];
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

- (void)setName:(NSString *)name {
    [_context setName:name];
}

- (JSValue *)evaluateScriptFromFile:(NSString *)file
                               func:(NSString *)func
                               args:(NSArray *)args {
    NSString *path = [[NSBundle mainBundle] pathForResource:[file componentsSeparatedByString:@"."][0] ofType:@"js"];
    NSString *fileString = [[SNJSFileManager shareInstance] contentForFileName:path];
    if (![_loadFiles valueForKey:path]) {
        [_loadFiles setValue:fileString forKey:path];
        JSValue *value = [_context evaluateScript:fileString];
        JSManagedValue *managedValue = [JSManagedValue managedValueWithValue:value];
        [_virtualMachine addManagedReference:managedValue withOwner:self];
    }
    JSValue *function = _context[func];
    JSValue *result = nil;
    if (function) {
        result = [function callWithArguments:args];
    }
    return result;
}

@end
