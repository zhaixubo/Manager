//
//  ViewController.m
//  Manager封装
//
//  Created by 翟旭博 on 2022/10/8.
//

#import "ViewController.h"
#import "Manager.h"
#import "TestModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
}
- (void)test {
    [[Manager sharedManage] NetWorkWithData:^(TestModel * _Nonnull mainViewModel) {
        NSLog(@"%@",mainViewModel.msg);
        NSLog(@"请求成功");
    } error:^(NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
}


@end
