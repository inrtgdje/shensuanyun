//
//  ViewController.m
//  CustomResource
//
//  Created by 汤天明 on 2018/8/28.
//  Copyright © 2018年 汤天明. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "TeachSet.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic,strong) JSContext *context;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    JSContext *context = [_webView valueForKeyPath:@"documentView.webView.mainFrame.JSContext"];
    self.context = [[JSContext alloc]init];
//    self.context = context;
    self.context.name = @"lefex.context";
    [self left_js];
}

- (void)add_js{
    
    NSString *addjs = @"function add(a,b) { return a + b;}; add(1,3)";
    [self.context evaluateScript:addjs withSourceURL:[NSURL URLWithString:@"add.js"]];
    //    NSLog(@"sum: %@",@([sumValue toInt32]));
    JSValue *resultVaule = [self.context[@"add"] callWithArguments:@[@2,@4]];
    NSLog(@"result: %@",@([resultVaule toInt32]));
}


- (void)left_js{
    
    NSString *js = @"var name = \"Lefe_x\";var log_name = function(aname){var res = 'Hello' + aname; console.log(res);};log_name(name);var age = 24;var sum_age = age + 1;";
    [self.context evaluateScript:js withSourceURL:[NSURL URLWithString:@"left.js"]];
    NSLog(@"%@",[self.context[@"name"] toString]);
    NSLog(@"%@",[self.context[@"sum_age"] toString]);
    [self.context setObject:@"objectC" forKeyedSubscript:@"ObjectC_add"];
    [self.context setExceptionHandler:^(JSContext *context, JSValue *exception) {
        NSLog(@"%@",exception);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
