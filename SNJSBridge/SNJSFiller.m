//
//  SNJSFiller.m
//  SNJSBridge
//
//  Created by Max Wang on 16/4/11.
//  Copyright © 2016年 Max. All rights reserved.
//

#import "SNJSFiller.h"

@implementation SNJSFiller

+ (void)emportMethod:(SNJSBridge *)bridge
                name:(NSString *)name
              method:(id(^)(JSContext *))method {
    id result = method(bridge.context);
    bridge.context[name] = result;
}

+ (void)loadCommonMethod:(SNJSBridge *)bridge {

}

@end
