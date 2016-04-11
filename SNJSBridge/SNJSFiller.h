//
//  SNJSFiller.h
//  SNJSBridge
//
//  Created by Max Wang on 16/4/11.
//  Copyright © 2016年 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNJSBridge.h"

@interface SNJSFiller : NSObject

+ (void)loadCommonMethod:(SNJSBridge *)bridge;

+ (void)emportMethod:(SNJSBridge *)bridge
                name:(NSString *)name
              method:(id(^)(JSContext *))method;

@end
