//
//  SNJSBridgePool.m
//  SNJSBridge
//
//  Created by Max Wang on 16/4/11.
//  Copyright © 2016年 Max. All rights reserved.
//

#import "SNJSBridgePool.h"
#import "SNJSBridge.h"

#define  max_concurrent_count 10

static SNJSBridgePool *_pool = nil;

@implementation SNJSBridgePool {
    dispatch_semaphore_t _l;
    dispatch_queue_t     _q;
    NSMutableArray *_bridges;
    NSMutableArray *_freeBridges;
}

+ (SNJSBridgePool *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _pool = [SNJSBridgePool new];
    });
    return _pool;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _l = dispatch_semaphore_create(max_concurrent_count);
        _q = dispatch_queue_create("js_bridge_queue", DISPATCH_QUEUE_CONCURRENT);
        _bridges = [NSMutableArray new];
        _freeBridges = [NSMutableArray new];
    }
    return self;
}

- (void)evaluateScriptFromFile:(NSString *)file
                          func:(NSString *)func
                          args:(NSArray *)args
                        finish:(void(^)(JSValue *value))finishBlock {
    dispatch_semaphore_wait(_l, DISPATCH_TIME_FOREVER);
    
    SNJSBridge *bridge = [_bridges lastObject];
    if (!bridge) {
        bridge = [[SNJSBridge alloc] initWithVirtualMachine:[JSVirtualMachine new]];
        [bridge setName:[NSString stringWithFormat:@"%@",bridge]];
    }else {
        [_bridges removeObject:bridge];
    }
    [_freeBridges addObject:bridge];
    dispatch_async(_q, ^{
        JSValue *value = [bridge evaluateScriptFromFile:file
                                                   func:func
                                                   args:args];
        [_bridges addObject:bridge];
        [_freeBridges removeObject:bridge];
        dispatch_semaphore_signal(_l);

        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(value);
            }
        });
    });
    
}

@end
