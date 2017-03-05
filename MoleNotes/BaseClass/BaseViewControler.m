//
//  BaseViewControler.m
//  MoleNotes
//
//  Created by wugang on 17/3/5.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import "BaseViewControler.h"

@interface BaseViewControler ()

@end

@implementation BaseViewControler

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor mlBacrgroundColor];
   
   [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
