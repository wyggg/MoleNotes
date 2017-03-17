//
//  YGPagesView.m
//  MoleNotes
//
//  Created by iOS wugang on 17/3/17.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import "YGPagesView.h"

@interface YGPagesView ()

//容器View
@property (nonatomic, strong) NSArray *contentViews;
@property (nonatomic, strong) UIView *scrollContentView;

//当前页面索引
@property (nonatomic, assign) NSInteger currIndex;

@end

@implementation YGPagesView

- (id)init{
    if (self = [super init]) {
        self.viewControllers = [NSMutableArray array];
        [self loadUI];
    }
    return self;
}

- (void)setViewControllers:(NSMutableArray<UIViewController *> *)viewControllers{
    _viewControllers = viewControllers;
    
    if (_viewControllers.count == 0) {
        return;
    }
    self.currIndex = -4;
}

- (void)setCurrIndex:(NSInteger)currIndex{
    
    NSInteger arrayCtn = _viewControllers.count-1;
    if (currIndex > arrayCtn) {
        NSInteger index = (currIndex+1) % arrayCtn;
        
        [self setCurrIndex:index];
        return;
        
    }
    if (currIndex<0){
        
        NSInteger index = (-currIndex+1) % arrayCtn;
        [self setCurrIndex:self.viewControllers.count - index];
        return;
    }
    
    _currIndex = currIndex;
    NSLog(@"___%ld",(long)_currIndex);
    
    
//    _currIndex = currIndex;
//    
//    for (int i = 0; i < 3; i++) {
//        UIView *vcContentView = _contentViews[i];
//        [[vcContentView viewWithTag:_currIndex + 110] removeFromSuperview];
//    }
//    
//    UIViewController *vc = _viewControllers[_currIndex];
//    vc.view.tag = _currIndex + 110;
    
    
}

///基本布局
- (void)loadUI{
    
    ///滑动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor orangeColor];
    scrollView.pagingEnabled = YES;
    [self addSubview:scrollView];
    
    ///滑动视图容器
    UIView *scrollContentView = [[UIView alloc] init];
    scrollContentView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:scrollContentView];
    [scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.offset(0);
        make.height.equalTo(self.mas_height);
        make.right.offset(0);
    }];
    
    NSMutableArray *viewArray = [NSMutableArray array];
    UIView *toView = nil;
    for (int i = 0; i < 3; i++) {
        
        ///控制器容器视图
        UIView *vcContentView = [[UIView alloc] init];
        [viewArray addObject:vcContentView];
        
        vcContentView.backgroundColor = [UIColor yellowColor];
        [scrollContentView addSubview:vcContentView];
        
        [vcContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (toView == nil) {
                make.left.offset(0);
            }else{
                make.left.equalTo(toView.mas_right);
            }
            make.top.offset(0);
            make.bottom.offset(0);
            make.width.equalTo(self.mas_width);
        }];
        toView = vcContentView;
    }
    
    self.contentViews = viewArray;
    
    [scrollContentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(toView.mas_right);
    }];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.bottom.offset(0);
        make.left.offset(0);
        make.right.offset(0);
        make.right.equalTo(scrollContentView.mas_right);
    }];
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
}



@end
