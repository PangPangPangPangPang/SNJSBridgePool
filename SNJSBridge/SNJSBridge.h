//
//  SNJSBridge.h
//  SNJSBridge
//
//  Created by Max on 16/4/9.
//  Copyright © 2016年 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface SNJSBridge : NSObject

@property (nonatomic, retain)JSContext *context;
@property (nonatomic, retain)NSString  *name;
- (instancetype)initWithVirtualMachine:(JSVirtualMachine *)machine NS_DESIGNATED_INITIALIZER;
- (JSValue *)evaluateScriptFromFile:(NSString *)file
                               func:(NSString *)func
                               args:(NSArray *)args;
@end
