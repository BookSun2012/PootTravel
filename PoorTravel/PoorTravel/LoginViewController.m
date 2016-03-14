//
//  LoginViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/14.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "LoginViewController.h"
#import "ZSY_Factory.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:[ZSY_Factory buttonWithFrame:CGRectMake(10, 20, 50, 30) Type:UIButtonTypeCustom Title:@"返回" fontSize:20 titleColor:[UIColor redColor] bgColor:[UIColor orangeColor] target:self selector:@selector(dismiss:) layer:3 supperView:self.view]];
    
}
- (void)dismiss:(UIButton *)butn {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
