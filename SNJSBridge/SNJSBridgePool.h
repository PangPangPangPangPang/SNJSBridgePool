//
//  SNJSBridgePool.h
//  SNJSBridge
//
//  Created by Max Wang on 16/4/11.
//  Copyright © 2016年 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>


@interface SNJSBridgePool : NSObject

@property (nonatomic, retain)JSContext *coreContext;

+ (SNJSBridgePool *)shareInstance;
- (void)evaluateScriptFromFile:(NSString *)file
                               func:(NSString *)func
                               args:(NSArray *)args
                             finish:(void(^)(JSValue *value))finishBlock;
@end
