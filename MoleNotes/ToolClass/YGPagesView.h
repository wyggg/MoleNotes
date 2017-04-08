//
//  YGPagesView.h
//  MoleNotes
//
//  Created by iOS wugang on 17/3/17.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGPagesView : UIView<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray <UIViewController *>*viewControllers;

@end
