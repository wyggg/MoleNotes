//
//  MLDataManager.m
//  MoleNotes
//
//  Created by iOS wugang on 2017/4/17.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import "MLDataManager.h"

@implementation MLDataManager

@synthesize context = _context;
@synthesize managedObjModle = _managedObjModle;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

#define kMLFileName @"MLNoteDatas.xcdatamodeld"

+ (id)shareDataManager{
     static MLDataManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

///得到数据库文件目录
- (NSURL *)applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - 操作方法

//保存
- (void)saveContext{
    
    if (self.context == nil) {
        NSLog(@"❌发生错误：context对象初始化失败 保存句柄失败");
    }else{
        
        //如果有变化
        if (self.context.hasChanges == YES) {
            
            NSError *error = nil;
            
            if ([self.context save:&error] == NO) {
                
                NSLog(@"保存句柄失败！%@",error);
                
            }else{
                NSLog(@"保存句柄成功！");
            }
            
        }
    }
    
}

#pragma mark - 关键对象加载

//懒加载表的实体
- (NSManagedObjectModel *)managedObjModle{
    if (_managedObjModle == nil) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"MLNoteDatas" withExtension:@"momd"];
        _managedObjModle = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return _managedObjModle;
}

//懒加载文件操作器
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjModle];
    
    //构建储存路径
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:kMLFileName];
    
    NSError *error = nil;
    
    [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                              configuration:nil
                                                        URL:storeURL
                                                    options:nil
                                                      error:&error];
    
    if (error != nil) {
        NSLog(@"⚠️初始化失败————%@",error);
        _persistentStoreCoordinator = nil;
    }
    
    return _persistentStoreCoordinator;
}

//懒加载操作句柄
- (NSManagedObjectContext *)context{
    if (_context==nil) {
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
        [context setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }
    return _context;
}




@end
