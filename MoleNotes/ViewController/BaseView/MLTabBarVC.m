//
//  MLTabBarVC.m
//  MoleNotes
//
//  Created by wugang on 17/3/5.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import "MLTabBarVC.h"

@interface MLTabBarVC ()

@end

@implementation MLTabBarVC

- (void)viewDidLoad {
   [super viewDidLoad];
   [self addViewControllers];
}

- (void)addViewControllers{
   
   self.tabBar.hidden = YES;
   NSMutableArray *vcArray = [NSMutableArray array];
   NSArray *titles = @[@"HomeVC"];
   for (int i=0; i<titles.count; i++) {
      BaseViewControler *baseVC = [[NSClassFromString(titles[i]) alloc] init];
      baseVC.title = titles[i];
      UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:baseVC];
      [vcArray addObject:nav];
   }
   self.viewControllers = [vcArray copy];
   
}

@end
