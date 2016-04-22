//
//  SNJSCommonFiller.m
//  SNJSBridge
//
//  Created by Max Wang on 16/4/11.
//  Copyright © 2016年 Max. All rights reserved.
//

#import "SNJSCommonFiller.h"
#import "SNJSFileManager.h"

@implementation SNJSCommonFiller

+ (void)loadCommonMethod:(SNJSBridge *)bridge {
    [self emportMethod:bridge
                  name:@"print"
                method:^id(JSContext *context) {
                    id method = ^(NSString *string) {
                        NSLog(@"SNJSBridge---%@",string);
                    };
                    return method;
                }];
    
    [self emportMethod:bridge
                  name:@"require"
                method:^id(JSContext *context) {
                    id method = ^(NSString *file) {
                        NSString *path = [[NSBundle mainBundle] pathForResource:[file componentsSeparatedByString:@"."][0] ofType:@"js"];
                        NSString * c = [[SNJSFileManager shareInstance] contentForFileName:path];
                        [context evaluateScript:c];
                    };
                    return method;
    }];
}
@end
