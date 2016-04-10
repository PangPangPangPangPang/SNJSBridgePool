//
//  ViewController.m
//  SNJSBridge
//
//  Created by Max on 16/4/9.
//  Copyright © 2016年 Max. All rights reserved.
//

#import "ViewController.h"
#import "SNJSBridge.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SNJSBridge *bridge = [[SNJSBridge alloc] initWithVirtualMachine:[JSVirtualMachine new]];
    JSValue *value = [bridge evaluateScriptFromFile:@"teacher.js"
                                               func:@"add"
                                               args:@[@4]];
    NSLog(@"%d",[value toInt32]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
