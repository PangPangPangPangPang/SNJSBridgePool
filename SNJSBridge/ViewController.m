//
//  ViewController.m
//  SNJSBridge
//
//  Created by Max on 16/4/9.
//  Copyright © 2016年 Max. All rights reserved.
//

#import "ViewController.h"
#import "SNJSBridge.h"
#import "SNJSBridgePool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        [[SNJSBridgePool shareInstance] evaluateScriptFromFile:@"main"
                                                          func:@"test"
                                                          args:@[@4]
                                                        finish:^(JSValue *value) {
                                                            NSLog(@"%@", [value toDictionary]);
                                                        }];
}

@end
