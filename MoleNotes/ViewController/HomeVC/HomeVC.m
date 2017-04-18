//
//  HomeVC.m
//  MoleNotes
//
//  Created by iOS wugang on 17/3/17.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import "HomeVC.h"
#import "MLDataManager.h"

@interface HomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
}

@property (nonatomic, weak) UICollectionView *noteListView;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo";
    [self loadUI];
    
    [MLDataManager shareDataManager];
}

- (void)loadUI{
    
    UICollectionViewFlowLayout *flowLay = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLay];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate   = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(reigtButtonAddEvents:)];
    self.navigationItem.rightBarButtonItem = barBtn;
    
}
#pragma mark - UICollectionView

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat w = kScreenW/2 - 8;
    
    return CGSizeMake(w, w);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

#pragma mark - ButtonEvents

- (void)reigtButtonAddEvents:(UIBarButtonItem *)item{
    
    Notes *noteModel = [NSEntityDescription insertNewObjectForEntityForName:@"Notes" inManagedObjectContext:[[MLDataManager shareDataManager] context]];
    noteModel.title = @"标题";
    noteModel.contentText = @"内容 内容 内容";
    noteModel.updateTime =[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]];
    [[MLDataManager shareDataManager] saveContext];
}

@end
