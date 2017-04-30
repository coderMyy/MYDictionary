//
//  ViewController.m
//  字典底层实现
//
//  Created by 孟遥遥 on 2017/4/30.
//  Copyright © 2017年 孟遥遥. All rights reserved.
//

#import "ViewController.h"
#import "MYDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MYDictionary *dict = [MYDictionary dictionary];
    [dict setValue:@"哈哈" forkey:@"孟"];
    [dict setValue:@"你好" forkey:@"孟"];
    [dict setValue:@123456 forkey:@"数字"];
    NSLog(@"%@",[dict valueForKey:@"孟"]);
    NSLog(@"%@",[dict valueForKey:@"数字"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
