//
//  HomeVC.m
//  MoleNotes
//
//  Created by iOS wugang on 17/3/17.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import "HomeVC.h"
#import "YGPagesView.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YGPagesView *pageView = [[YGPagesView alloc] init];
    [self.view addSubview:pageView];
    [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.width.offset(kScreenW);
        make.height.offset(kScreenH-100);
    }];
    
    NSArray *array = @[@"AVC",@"BVC",@"CVC"];
    NSMutableArray *vcArray = [NSMutableArray array];
    for (NSString *className in array) {
        
        Class vcClass = NSClassFromString(className);
        UIViewController *vc = [[vcClass alloc] init];
        [vcArray addObject:vc];
    }
    pageView.viewControllers = vcArray;
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
