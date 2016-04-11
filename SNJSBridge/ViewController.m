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
    // Do any additional setup after loading the view, typically from a nib.
    for (int i = 0; i < 16; i++) {
        [[SNJSBridgePool shareInstance] evaluateScriptFromFile:@"teacher.js"
                                                          func:@"add"
                                                          args:@[@4]
                                                        finish:^(JSValue *value) {
                                                            NSLog(@"finished");
                                                        }];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
