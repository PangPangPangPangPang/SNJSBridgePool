//
//  SNJSCommonFiller.m
//  SNJSBridge
//
//  Created by Max Wang on 16/4/11.
//  Copyright © 2016年 Max. All rights reserved.
//

#import "SNJSCommonFiller.h"

@implementation SNJSCommonFiller

+ (void)loadCommonMethod:(SNJSBridge *)bridge {
    [self emportMethod:bridge
                  name:@"xixi"
                method:^id(JSContext *context) {
                    
                    id method = ^(NSString *string) {
                        return [NSString stringWithFormat:@"xixi----%@",string];
                    };
                    return method;
    
    }];
}
@end
